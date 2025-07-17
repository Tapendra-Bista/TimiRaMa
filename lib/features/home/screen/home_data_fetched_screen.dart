//------------ main part of data fetched state-----------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/home/widget/home_data_fetched_screen_widgets.dart';
import 'package:timirama/features/home/widget/home_widgets.dart';
import 'package:timirama/features/stories/screen/stories_screen.dart';

class HomeDataContent extends StatelessWidget {
  const HomeDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.floralWhite,
        onRefresh: () async {
          context.read<HomeBloc>().add(HomeUsersProfileList());
        },
        child: CustomScrollView(
          slivers: [
            //-------------------app bar-------------------
            const HomePlatformAppBar(),
            //-------------------Stories-------------------
            const StoriesScreen(),
            const UserImageGrid(),
          ],
        ),
      ),
    );
  }
}
