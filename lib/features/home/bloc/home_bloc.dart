import 'package:firebase_auth/firebase_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:timirama/common/constant/profile_model_constants.dart';
import 'package:timirama/features/archive/model/archive_model.dart';
import 'package:timirama/features/archive/repository/archive_repository.dart';
import 'package:timirama/features/block/model/block_model.dart';
import 'package:timirama/features/block/repository/block_repository.dart';
import 'package:timirama/features/favorite/model/favorite_model.dart';
import 'package:timirama/features/favorite/repository/favorite_repository.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/features/home/repository/home_repository.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/profile/repository/profile_repository.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final ProfileRepository _profileRepository;
  final FavoriteRepository _favoriteRepository;
  final BlockRepository _blockRepository;
  final ArchiveRepository _archiveRepository;

  HomeBloc({
    required HomeRepository repository,
    required ProfileRepository profileRepository,
    required FavoriteRepository favoriteRepository,
    required BlockRepository blockRepository,
    required ArchiveRepository archiveRepository,
  })  : _repository = repository,
        _profileRepository = profileRepository,
        _favoriteRepository = favoriteRepository,
        _blockRepository = blockRepository,
        _archiveRepository = archiveRepository,
        super(HomeInitial()) {
              on<HomeUsersFetched>((event, emit) async {
      try {
        emit(Loading.fromState(state));
        final List<ProfileModel?> data =
            await _repository.fetchAllExceptCurrentUser();
        emit(state.copyWith(data: data));
      } catch (e) {
        emit(Error.fromState(state, error: e.toString()));
      }
    });
    on<HomeUsersProfileList>((event, emit) async {
      try {
        emit(Loading.fromState(state));

        // Execute API calls in parallel for better performance
        final results = await Future.wait([
          _repository.fetchAllExceptCurrentUser(),
          _profileRepository.fetchProfileData(),
          _favoriteRepository.fetchFavorites(),
          _blockRepository.fetchBlocks(),
          _archiveRepository.fetchArchives(),
        ]);

        final List<ProfileModel?> data = results[0] as List<ProfileModel?>;
        final ProfileModel? currentUser = results[1] as ProfileModel?;
        final FavoriteModel? favData = results[2] as FavoriteModel?;
        final BlockModel? blockData = results[3] as BlockModel?;
        final ArchiveModel? archiveData = results[4] as ArchiveModel?;

        // Filter out null or empty id users
        final List<ProfileModel> validUsers = data.where((u) => u != null && u.id.isNotEmpty).cast<ProfileModel>().toList();

        // Fetch block lists of other users (who blocked me)
        final Map<String, List<String>> blockedByOthers = await _blockRepository.fetchOtherUsersBlockListsInChunks(validUsers);

        // Step 6: Filter users by block/archive/favorite
        final filteredUsers = validUsers.where((user) {
          final blockedByMe = blockData?.blockId.contains(user.id) ?? false;
          final archivedByMe = archiveData?.archiveId.contains(user.id) ?? false;
          final favoredByMe = favData?.favId.contains(user.id) ?? false;
          final blockedMe = blockedByOthers[user.id]?.contains(FirebaseAuth.instance.currentUser!.uid) ?? false;

          return !(blockedByMe || archivedByMe || favoredByMe || blockedMe);
        }).toList();

        // Step 7: Prepare interests vector and compute compatibility scores on filtered users
        final allInterests = ProfileModelConstants.allInterests.toSet().toList();
        final currentVector = _repository.buildInterestVector(currentUser!.interests, allInterests);

        final List<ScoredProfileModel> scoredProfiles = filteredUsers.map((user) {
          final userVector = _repository.buildInterestVector(user.interests, allInterests);
          final score = _repository.cosineSimilarity(currentVector, userVector);
          return ScoredProfileModel(profile: user, score: score);
        }).toList();

        // Step 8: Sort scoredProfiles by score descending
        scoredProfiles.sort((a, b) => b.score.compareTo(a.score));

        // Step 9: Prepare map of scores and list of profiles for state
        final Map<String, double> compatibilityScores = {
          for (var sp in scoredProfiles) sp.profile.id: sp.score,
        };
        final List<ProfileModel> profileList = scoredProfiles.map((e) => e.profile).toList();

        print("CompatibilityScores : $compatibilityScores");

        // Step 10: Emit final state with sorted profiles and scores
        emit(state.copyWith(
          profileList: profileList,
          compatibilityScores: compatibilityScores,
        ));
      } catch (e) {
        print("Error in home screen :${e.toString()}");
        emit(Error.fromState(state, error: e.toString()));
      }
    });
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      final dataList = (json['data'] as List).map((e) => e == null ? null : ProfileModel.fromJson(e)).toList();

      final profileList = (json['profileList'] as List).map((e) => e == null ? null : ProfileModel.fromJson(e)).toList();

      final compatibilityScores = (json['compatibilityScores'] as Map?)?.map((key, value) => MapEntry(key as String, value as double)) ?? {};

      return HomeState(
        data: dataList,
        profileList: profileList,
        compatibilityScores: compatibilityScores,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    try {
      return {
        'data': state.data.map((e) => e?.toJson()).toList(),
        'profileList': state.profileList.map((e) => e?.toJson()).toList(),
        'compatibilityScores': state.compatibilityScores,
      };
    } catch (e) {
      return null;
    }
  }
}
