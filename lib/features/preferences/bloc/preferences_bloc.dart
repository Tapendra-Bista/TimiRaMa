import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'preferences_bloc.freezed.dart';
part 'preferences_bloc.g.dart';
part 'preferences_event.dart';
part 'preferences_state.dart';

//Bloc
class PreferencesBloc extends HydratedBloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(PreferencesState()) {
    on<GenderPreferencesRequested>(_onGenderPreferencesRequested);
    on<AgePreferencesRequested>(_onAgePreferencesRequested);
    on<LocationPreferencesRequested>(_onLocationPreferencesRequested);
  }

//-gender
  _onGenderPreferencesRequested(
          GenderPreferencesRequested event, Emitter<PreferencesState> emit) =>
      emit(state.copyWith(
          men: event.men,
          isMenClicked: event.isMenClicked,
          women: event.women,
          isWomenClicked: event.isWomenClicked));
//age-
  _onAgePreferencesRequested(
          AgePreferencesRequested event, Emitter<PreferencesState> emit) =>
      emit(state.copyWith(start: event.start, end: event.end));

  //Location
  _onLocationPreferencesRequested(
          LocationPreferencesRequested event, Emitter<PreferencesState> emit) =>
      emit(state.copyWith(
          city: event.city,
          isCityClicked: event.isCityClicked,
          country: event.country,
          isCountryClicked: event.isCountryClicked));

  @override
  PreferencesState? fromJson(Map<String, dynamic> json) {
    try {
      return PreferencesState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(PreferencesState state) {
    try {
      return state.toJson();
    } catch (_) {
      return null;
    }
  }
}
