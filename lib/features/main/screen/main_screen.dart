import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/archive/bloc/archive_bloc.dart';
import 'package:timirama/features/archive/bloc/archive_event.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_event.dart';
import 'package:timirama/features/chat/bloc/chat_bloc.dart';
import 'package:timirama/features/chat/bloc/chat_event.dart';
import 'package:timirama/features/chat/screen/chat_rooms_screen.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_event.dart';
import 'package:timirama/features/follow/bloc/follow_bloc.dart';
import 'package:timirama/features/follow/bloc/follow_event.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/home/screen/home_screen.dart';
import 'package:timirama/features/like/bloc/like_bloc.dart';
import 'package:timirama/features/like/bloc/like_event.dart';
import 'package:timirama/features/match/screen/match_screen.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_bloc.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_event.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';
import 'package:timirama/features/reels/screen/reels_screen.dart';
import 'package:timirama/features/stories/bloc/stories_bloc.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/status/repository/status_repository.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Key _bottomNavKey = UniqueKey();

  final List<Widget> _widgets = [
    const HomeScreen(),
    const MatchScreen(),
    const SizedBox.shrink(),
    ChatRoomsScreen(),
    const ReelsScreen(),
  ];

  @override
  void initState() {
    super.initState();

    if (FirebaseAuth.instance.currentUser != null) {
      StatusRepository().setupUserPresence();

      context.read<BlockBloc>().add(BlockUsersFetched());
      context.read<StoriesBloc>().add(StoriesFetching());
      context.read<ProfileBloc>().add(ProfileFetch());
      context.read<FavoriteBloc>().add(FavoriteUsersFetched());
      context.read<LikeBloc>().add(LikeUsersFetched());
      context.read<FollowBloc>().add(FollowUsersFetched());
      context.read<ArchiveBloc>().add(ArchiveUsersFetched());
      context.read<HomeBloc>().add(HomeUsersFetched());
      context.read<ChatBloc>().add(
        ChatRoomsLists(id: FirebaseAuth.instance.currentUser!.uid),
      );
      context.read<HomeBloc>().add(HomeUsersProfileList());
      context.read<ReelBloc>().add(ReelLoaded());
      context.read<ReelLikeBloc>().add(ReelLikeUsersFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: _widgets[_selectedIndex],
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.floralWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: GNav(
              key: _bottomNavKey,
              rippleColor: AppColors.grey.withValues(alpha: 0.2),
              hoverColor: AppColors.grey.withValues(alpha: 0.2),
              gap: 8.w,
              activeColor: AppColors.primaryColor,
              iconSize: 24.r,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.grey.withValues(alpha: 0.2),
              color: Colors.black,
              tabs: [
                GButton(
                  textStyle: theme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  iconSize: 27.r,
                  gap: 5.w,
                  icon: HugeIcons.strokeRoundedLocation01,
                ),
                GButton(
                  textStyle: theme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  gap: 5.w,
                  iconSize: 27.r,
                  icon: HugeIcons.strokeRoundedCards01,
                ),
                GButton(
                  textStyle: theme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  gap: 5.w,
                  iconSize: 27.r,
                  icon: CupertinoIcons.plus,
                ),
                GButton(
                  textStyle: theme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  gap: 5.w,
                  iconSize: 27.r,
                  icon: CupertinoIcons.chat_bubble,
                ),
                GButton(
                  textStyle: theme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                  iconSize: 27.r,
                  gap: 5.w,
                  icon: CupertinoIcons.play_arrow,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                if (index == 2) {
                  Get.toNamed(AppRoutes.add)?.then((_) {
                    setState(() {
                      _bottomNavKey = UniqueKey();
                    });
                  });
                } else {
                  setState(() {
                    _selectedIndex = index;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
