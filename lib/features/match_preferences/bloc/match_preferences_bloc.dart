import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'match_preferences_bloc.freezed.dart';
part 'match_preferences_bloc.g.dart';
part 'match_preferences_event.dart';
part 'match_preferences_state.dart';

//Bloc
class MatchPreferencesBloc
    extends HydratedBloc<MatchPreferencesEvent, MatchPreferencesState> {
  MatchPreferencesBloc() : super(MatchPreferencesState()) {
    on<GenderMatchPreferencesRequested>(_onGenderMatchPreferencesRequested);
    on<AgeMatchPreferencesRequested>(_onAgeMatchPreferencesRequested);
    on<LocationMatchPreferencesRequested>(_onLocationMatchPreferencesRequested);
  }

  //-gender
  _onGenderMatchPreferencesRequested(
    GenderMatchPreferencesRequested event,
    Emitter<MatchPreferencesState> emit,
  ) =>
      emit(
        state.copyWith(
          men: event.men,
          isMenClicked: event.isMenClicked,
          women: event.women,
          isWomenClicked: event.isWomenClicked,
        ),
      );
  //age-
  _onAgeMatchPreferencesRequested(
    AgeMatchPreferencesRequested event,
    Emitter<MatchPreferencesState> emit,
  ) =>
      emit(state.copyWith(start: event.start, end: event.end));

  //Location
  _onLocationMatchPreferencesRequested(
    LocationMatchPreferencesRequested event,
    Emitter<MatchPreferencesState> emit,
  ) =>
      emit(
        state.copyWith(
          city: event.city,
          isCityClicked: event.isCityClicked,
          country: event.country,
          isCountryClicked: event.isCountryClicked,
        ),
      );

  @override
  MatchPreferencesState? fromJson(Map<String, dynamic> json) {
    try {
      return MatchPreferencesState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(MatchPreferencesState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}
