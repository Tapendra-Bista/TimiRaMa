import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/chat/screen/chat_screen.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/features/match/bloc/match_bloc.dart';
import 'package:timirama/features/match/widget/card_screen_widget.dart';
import 'package:timirama/features/match_preferences/bloc/match_preferences_bloc.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/routes/app_routes.dart';

import '../model/match_filter.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final CardSwiperController controller = CardSwiperController();

  int _currentIndex = 0; // Track current index manually

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<HomeBloc, HomeState, List<ProfileModel?>>(
      selector: (state) => state.profileList,
      builder: (context, userData) {
        return BlocSelector<MatchPreferencesBloc, MatchPreferencesState,
            MatchPreferencesState>(
          selector: (state) => state,
          builder: (context, state) {
            final matchUsers = getFilterData(userData, state);

            if (matchUsers.isEmpty && isFilterActive(state)) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 150.h),
                  child: Center(
                    child: Text(
                      EnumLocale.noProfileMatchYourFilters.name.tr,
                      style: theme.bodyMedium,
                    ),
                  ),
                ),
              );
            }

            return BlocListener<MatchBloc, MatchState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (
                    bool isMutualMatch,
                    String matchedUserId,
                    String matchedUserName,
                    String matchedUserImage,
                  ) {
                    if (isMutualMatch) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("It's a Match!"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 15.h,
                              children: [
                                Center(
                                    child: Text(
                                  "You can now send a message. Say hi?",
                                  style: theme.bodySmall,
                                )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      child: Text("Cancel"),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  AppColors.primaryColor)),
                                      child: Text(
                                        "Send 'Hi'",
                                        style: theme.bodyMedium!
                                            .copyWith(color: AppColors.white),
                                      ),
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.of(context).pop();

                                        // Navigate to ChatScreen
                                        Get.to(() => ChatScreen(
                                              preMessage: "Hi 👋",
                                              imgURL:
                                                  matchedUserImage, // get from user model
                                              receiverId: matchedUserId,
                                              receiverName: matchedUserName,
                                            ));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  failure: (error) {
                    snackBarMessage(
                        context, 'Swipe failed: $error', Theme.of(context));
                  },
                  orElse: () {},
                );
              },
              child: PlatformScaffold(
                appBar: PlatformAppBar(
                  material: (context, platform) {
                    return MaterialAppBarData(centerTitle: true);
                  },
                  trailingActions: [
                    PlatformIconButton(
                      onPressed: () => Get.toNamed(AppRoutes.matchPreferences),
                      icon: Icon(Icons.tune_outlined, size: 35.r),
                    ),
                  ],
                  title: Image.asset(AppStrings.logoImage, width: 200.w),
                  leading: PlatformIconButton(
                    onPressed: () => Get.toNamed(AppRoutes.profile),
                    icon: Icon(LineIcons.user, size: 35.r),
                  ),
                ),
                body: SafeArea(
                  child: matchUsers.length >= 2
                      ? CardSwiper(
                          padding: EdgeInsetsGeometry.symmetric(
                              horizontal: 8.w, vertical: 30.h),
                          controller: controller,
                          threshold: 100,
                          onSwipe: (previousIndex, currentIndex, direction) {
                            _currentIndex =
                                currentIndex!; // Update current index here
                            if (direction == CardSwiperDirection.right) {
                              final swipedUserId =
                                  matchUsers[previousIndex]!.id;
                              context.read<MatchBloc>().add(
                                    HandleRightSwipe(
                                      matchedUserId: swipedUserId,
                                      swipedUserId: swipedUserId,
                                      matchedUserName:
                                          matchUsers[previousIndex]!.pseudo,
                                      matchedUserImage:
                                          matchUsers[previousIndex]!.imgURL,
                                    ),
                                  );
                            }

                            return true;
                          },
                          allowedSwipeDirection: AllowedSwipeDirection.only(
                            left: true,
                            right: true,
                            up: false,
                            down: false,
                          ),
                          maxAngle: 60,
                          isDisabled: false,
                          duration: Duration(milliseconds: 500),
                          numberOfCardsDisplayed: 1,
                          cardBuilder: (context, index, _, __) {
                            final item = matchUsers[index];
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.floralWhite,
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color: AppColors.grey, width: 1.w),
                              ),
                              child: ImageAndStatus(
                                user: item!,
                                controller: controller,
                                currentIndex: _currentIndex,
                                matchUsers: matchUsers,
                              ),
                            );
                          },
                          cardsCount: matchUsers.length,
                        )
                      : Center(
                          child: Text(
                            EnumLocale.atLeastTwoUsers.name.tr,
                            style: theme.bodySmall,
                          ),
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
