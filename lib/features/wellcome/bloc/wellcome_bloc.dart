import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'wellcome_bloc.freezed.dart';
part 'wellcome_bloc.g.dart';
part 'wellcome_event.dart';
part 'wellcome_state.dart';

//-----------------------------Bloc for wellcome page-----------------------------------
class WellcomeBloc extends HydratedBloc<WellcomeEvent, WellcomeState> {
  WellcomeBloc() : super(WellcomeState()) {
    on<ChangeLanguage>((event, emit) {
     emit(state.copyWith(languageCode: event.languageCode));
    });
  }

  @override
  WellcomeState? fromJson(Map<String, dynamic> json) {
    try {
      final languageCode = json['languageCode'] as String?;

      return WellcomeState(languageCode: languageCode!);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WellcomeState state) {
    try {
      return {'languageCode': state.languageCode};
    } catch (_) {
      return null;
    }
  }
}


