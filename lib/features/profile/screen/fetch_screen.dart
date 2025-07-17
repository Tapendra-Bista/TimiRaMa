//------------ main part of data fetched state-----------------
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/features/profile/widget/profile_widget.dart';

class ProfileDataContent extends StatelessWidget {
  const ProfileDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: CustomScrollView(
        slivers: [
          //-------------------app bar-------------------
          const ProfilePlatformAppBar(),
          //---------------User Profile Image--------------------
          ProfileImage(),
          SliverToBoxAdapter(child: SizedBox(height: 5.h)),
          const UserSeniority(),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          //---------------User Profile Details--------------------
          const UserDetails(),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          //------------------------------ user interests------------------------------
          const UserInterestsList(),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          const DescriptionText(),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        ],
      ),
    );
  }
}
