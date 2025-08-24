// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

//Fav State
class FavoriteState extends Equatable {
  final List<ProfileModel> favUserList;
  const FavoriteState({required this.favUserList});

  @override
  List<Object> get props => [favUserList];
}

final class FavoriteInitial extends FavoriteState {
  FavoriteInitial() : super(favUserList: []);
}

final class FavoriteUsersLoading extends FavoriteState {
  FavoriteUsersLoading() : super(favUserList: []);
}

final class FavoriteUsersError extends FavoriteState {
  final String errorMessage;

  FavoriteUsersError.fromState(
    FavoriteState state, {
    required this.errorMessage,
  }) : super(favUserList: state.favUserList);

  @override
  List<Object> get props => [errorMessage];
}

final class FavoriteDataEmpty extends FavoriteState {
  FavoriteDataEmpty() : super(favUserList: []);
}
