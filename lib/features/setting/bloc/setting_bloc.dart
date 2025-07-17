import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_event.dart';
part 'setting_state.dart';
part 'setting_bloc.freezed.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(_Initial()) {
    on<SetToEnglish>((event, emit) => SettingState.getEnglish());
    on<SetToFrance>((event, emit) => SettingState.getFrance());
  }
}
