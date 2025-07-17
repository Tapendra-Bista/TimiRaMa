// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_preferences_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchPreferencesState _$MatchPreferencesStateFromJson(
        Map<String, dynamic> json) =>
    _MatchPreferencesState(
      men: json['men'] as String? ?? '',
      isMenClicked: json['isMenClicked'] as bool? ?? false,
      women: json['women'] as String? ?? '',
      isWomenClicked: json['isWomenClicked'] as bool? ?? false,
      start: (json['start'] as num?)?.toDouble() ?? 18.0,
      end: (json['end'] as num?)?.toDouble() ?? 60.0,
      country: json['country'] as String? ?? '',
      city: json['city'] as String? ?? '',
      isCityClicked: json['isCityClicked'] as bool? ?? false,
      isCountryClicked: json['isCountryClicked'] as bool? ?? false,
    );

Map<String, dynamic> _$MatchPreferencesStateToJson(
        _MatchPreferencesState instance) =>
    <String, dynamic>{
      'men': instance.men,
      'isMenClicked': instance.isMenClicked,
      'women': instance.women,
      'isWomenClicked': instance.isWomenClicked,
      'start': instance.start,
      'end': instance.end,
      'country': instance.country,
      'city': instance.city,
      'isCityClicked': instance.isCityClicked,
      'isCountryClicked': instance.isCountryClicked,
    };
