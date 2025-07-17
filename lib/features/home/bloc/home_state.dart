import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

part 'home_state.g.dart';


@JsonSerializable()
class HomeState extends Equatable {
  final List<ProfileModel?> data;
  final List<ProfileModel?> profileList;
  final Map<String, double> compatibilityScores;

  const HomeState({
    required this.data,
    required this.profileList,
    required this.compatibilityScores,
  });

  HomeState copyWith({
    List<ProfileModel?>? data,
    List<ProfileModel?>? profileList,
    Map<String, double>? compatibilityScores,
  }) =>
      HomeState(
        data: data ?? this.data,
        profileList: profileList ?? this.profileList,
        compatibilityScores: compatibilityScores ?? this.compatibilityScores,
      );

  factory HomeState.initial() {
    return HomeState(
      data: [],
      profileList: [],
      compatibilityScores: {},
    );
  }

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);

  Map<String, dynamic> toJson() => _$HomeStateToJson(this);

  @override
  List<Object> get props => [data, profileList, compatibilityScores];
}


final class HomeInitial extends HomeState {
  HomeInitial() : super(data: [], profileList: [], compatibilityScores: {});
}

final class Loading extends HomeState {
  Loading.fromState(HomeState state)
      : super(
          data: state.data,
          profileList: state.profileList,
          compatibilityScores: state.compatibilityScores,
        );
}

final class Error extends HomeState {
  final String error;
  Error.fromState(HomeState state, {required this.error})
      : super(
          data: state.data,
          profileList: state.profileList,
          compatibilityScores: state.compatibilityScores,
        );

  @override
  List<Object> get props => [data, profileList, compatibilityScores, error];
}

final class HomeDataIsEmpty extends HomeState {
  HomeDataIsEmpty.fromState(HomeState state)
      : super(
          data: state.data,
          profileList: state.profileList,
          compatibilityScores: state.compatibilityScores,
        );
}
