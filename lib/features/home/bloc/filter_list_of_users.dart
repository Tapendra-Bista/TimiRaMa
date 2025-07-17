import 'package:timirama/features/preferences/bloc/preferences_bloc.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

List<ProfileModel?> getFilterData(
  List<ProfileModel?> profile,
  PreferencesState state,
) {
  return profile.where((item) {
    if (item == null) return false;

    // Always filter by age
    final matchAge = item.age >= state.start && item.age <= state.end;

    //  Gender logic
    bool matchSex = true;
    if (state.isMenClicked || state.isWomenClicked) {
      matchSex = (state.isMenClicked && item.sex == state.men) ||
          (state.isWomenClicked && item.sex == state.women);
    }

    //  City logic (same approach: show all if not clicked)
    bool matchCity = true;
    if (state.isCityClicked) {
      matchCity = item.city == state.city;
    }

    //  Country logic (same approach)
    bool matchCountry = true;
    if (state.isCountryClicked) {
      matchCountry = item.country == state.country;
    }

    final result = matchAge && matchSex && matchCity && matchCountry;

    print(
      'Checking ${item.pseudo}: age=${item.age}, sex=${item.sex}, '
      'city=${item.city}, country=${item.country} => '
      'ageMatch=$matchAge, sexMatch=$matchSex, cityMatch=$matchCity, '
      'countryMatch=$matchCountry => result=$result',
    );

    return result;
  }).toList();
}

bool isFilterActive(PreferencesState state) {
  return state.isMenClicked ||
      state.isWomenClicked ||
      state.isCityClicked ||
      state.isCountryClicked ||
      state.start != 18 ||
      state.end != 60;
}
