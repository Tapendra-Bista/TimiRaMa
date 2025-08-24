import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/features/setting/widget/setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: CustomScrollView(
        slivers: [
          // app Bar
          SettingPlatformAppBar(),
          // -Body
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                CustomDivider(),
                //Archive user list-
                ArchiveListTile(),
                CustomDivider(),
                //Blocked user list-
                BlockedListTile(),
                CustomDivider(),
                //-Help center
                HelpListTile(),
                //-divider-
                CustomDivider(),

                //Change Language
                LanguageListTile(),
                //-divider-
                CustomDivider(),
                //-fav  list
                FavoritesListTile(),
                CustomDivider(),

                //-Notification -
                NotificationListTile(),
                //-divider-
                CustomDivider(),

                //Logout-
                LogoutListTile(),
                //-divider-
                CustomDivider(),

                //Privacy Settings
                PrivacyListTile(),
                //-divider-
                CustomDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
