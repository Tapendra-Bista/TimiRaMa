import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timirama/features/match/repository/match_repository.dart';

part 'match_event.dart';
part 'match_state.dart';
part 'match_bloc.freezed.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final MatchRepository _matchRepository;

  MatchBloc({required MatchRepository matchRepository})
      : _matchRepository = matchRepository,
        super(const MatchState.initial()) {
    on<HandleRightSwipe>(_onHandleRightSwipe);
  }

  Future<void> _onHandleRightSwipe(
      HandleRightSwipe event, Emitter<MatchState> emit) async {


    try {
      final isMutualMatch = await _matchRepository.handleRightSwipe(event.swipedUserId);
      emit(MatchState.success(isMutualMatch: isMutualMatch,matchedUserId: event.matchedUserId,  matchedUserImage: event.matchedUserImage , matchedUserName: event.matchedUserName));
    } catch (e) {
      emit(MatchState.failure(error: e.toString()));
    }
  }
}
