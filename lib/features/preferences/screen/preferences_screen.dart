import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/preferences/bloc/preferences_bloc.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

class PreferencesScreen extends StatelessWidget {
  PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    // Use context to get the bloc instance tied to the widget tree
    final _preferencesBloc = context.read<PreferencesBloc>();
    final _homeBloc = context.read<HomeBloc>();

    return PlatformScaffold(
      appBar: PlatformAppBar(
        material: (context, platform) => MaterialAppBarData(centerTitle: true),
        title: Text(
          EnumLocale.preferences.name.tr,
          style: theme.bodyMedium!.copyWith(fontSize: 22.sp),
        ),
        leading: PlatformIconButton(
          onPressed: () => Get.back(),
          icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
        ),
      ),
      body: BlocBuilder<PreferencesBloc, PreferencesState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType || previous != current,
        builder: (context, state) {
          return BlocSelector<ProfileBloc, ProfileState, ProfileModel>(
            selector: (state) =>
                (state is ProfileLoaded) ? state.data : ProfileModel.empty(),
            builder: (context, currentUserData) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 15.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 15.h,
                      children: [
                        CustomDivider(),
                        Text(
                          EnumLocale.likeToMeet.name.tr,
                          style: theme.bodyMedium!.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            _buildPreferenceButton(
                              label: EnumLocale.genderMale.name.tr,
                              isSelected: state.isMenClicked,
                              onTap: () {
                                final toggled = !state.isMenClicked;
                                _preferencesBloc.add(
                                  GenderPreferencesRequested(
                                    isMenClicked: toggled,
                                    men: toggled
                                        ? EnumLocale.genderMale.name.tr
                                        : '',
                                    isWomenClicked: state.isWomenClicked,
                                    women: state.women,
                                  ),
                                );
                                _homeBloc.add(HomeUsersProfileList());
                              },
                            ),
                            SizedBox(width: 10.w),
                            _buildPreferenceButton(
                              label: EnumLocale.genderFemale.name.tr,
                              isSelected: state.isWomenClicked,
                              onTap: () {
                                final toggled = !state.isWomenClicked;
                                _preferencesBloc.add(
                                  GenderPreferencesRequested(
                                    isWomenClicked: toggled,
                                    women: toggled
                                        ? EnumLocale.genderFemale.name.tr
                                        : '',
                                    isMenClicked: state.isMenClicked,
                                    men: state.men,
                                  ),
                                );
                                _homeBloc.add(HomeUsersProfileList());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 35.h),
                        CustomDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              EnumLocale.age.name.tr,
                              style: theme.bodyMedium!.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "${state.start.toInt()} - ${state.end.toInt()} ${EnumLocale.years.name.tr}",
                              style: theme.bodyMedium!.copyWith(
                                fontSize: 18.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        RangeSlider(
                          min: 18,
                          max: 60,
                          labels: RangeLabels(
                            state.start.toString(),
                            state.end.toString(),
                          ),
                          inactiveColor: AppColors.grey,
                          activeColor: AppColors.primaryColor,
                          values: RangeValues(state.start, state.end),
                          onChanged: (newValue) {
                            _preferencesBloc.add(
                              AgePreferencesRequested(
                                newValue.start,
                                newValue.end,
                              ),
                            );
                            _homeBloc.add(HomeUsersProfileList());
                          },
                        ),
                        SizedBox(height: 35.h),
                        CustomDivider(),
                        Text(
                          EnumLocale.same.name.tr,
                          style: theme.bodyMedium!.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            _buildPreferenceButton(
                              label: EnumLocale.sameCountry.name.tr,
                              isSelected: state.isCountryClicked,
                              onTap: () {
                                final toggled = !state.isCountryClicked;
                                _preferencesBloc.add(
                                  LocationPreferencesRequested(
                                    isCountryClicked: toggled,
                                    country: toggled
                                        ? currentUserData.country
                                        : '',
                                    isCityClicked: state.isCityClicked,
                                    city: state.city,
                                  ),
                                );
                                _homeBloc.add(HomeUsersProfileList());
                              },
                            ),
                            SizedBox(width: 10.w),
                            _buildPreferenceButton(
                              label: EnumLocale.sameCity.name.tr,
                              isSelected: state.isCityClicked,
                              onTap: () {
                                final toggled = !state.isCityClicked;
                                _preferencesBloc.add(
                                  LocationPreferencesRequested(
                                    isCityClicked: toggled,
                                    city: toggled ? currentUserData.city : '',
                                    isCountryClicked: state.isCountryClicked,
                                    country: state.country,
                                  ),
                                );
                                _homeBloc.add(HomeUsersProfileList());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 25.h),
                        CustomDivider(),
                        SizedBox(height: 10.w),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// Custom button builder for preferences
  Widget _buildPreferenceButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 82.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: AppColors.greyContainerColor,
          border: isSelected
              ? Border.all(color: AppColors.primaryColor, width: 1.w)
              : null,
        ),
        child: Center(
          child: Text(label, style: TextStyle(color: AppColors.black)),
        ),
      ),
    );
  }
}
