part of 'add_bloc.dart';

@freezed
abstract class AddState with _$AddState {
  const factory AddState() = _AddState;
  const factory AddState.loading() = AddReelLoading;
  const factory AddState.success() = AddReelSuccess;
  const factory AddState.error({required String errorMessage}) =  PostingError;
  const factory AddState.validUrl({
    @Default('') String videoUrl,
  }) = ValidUrl;
}
