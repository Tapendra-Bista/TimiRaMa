//-PlatformAppBar Title
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/loading.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';

class FavoritesListTile extends StatelessWidget {
  const FavoritesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.favorite),
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedFavouriteSquare),
      title: SizedBox(
        width: 50.w,
        child: Text(
          EnumLocale.favorites.name.tr,
          style: theme.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

//-Archive user
class ArchiveListTile extends StatelessWidget {
  const ArchiveListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.archive),
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedArchive),
      title: Text(
        EnumLocale.archive.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//-Blocked user
class BlockedListTile extends StatelessWidget {
  const BlockedListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () => Get.toNamed(AppRoutes.block),
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedBlocked),
      title: Text(
        EnumLocale.blocked.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//App Bar
class SettingPlatformAppBar extends StatelessWidget {
  const SettingPlatformAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: PlatformIconButton(
        onPressed: () => Get.back(),
        icon: Icon(HugeIcons.strokeRoundedMultiplicationSign),
      ),
      title: SettingTitle(),
      centerTitle: true,
    );
  }
}

//-Title Text
class SettingTitle extends StatelessWidget {
  const SettingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      EnumLocale.settings.name.tr,
      style: theme.bodyLarge!.copyWith(fontSize: 18.sp),
      overflow: TextOverflow.ellipsis,
    );
  }
}

//Change Language
class LanguageListTile extends StatefulWidget {
  LanguageListTile({super.key});

  @override
  State<LanguageListTile> createState() => _LanguageListTileState();
}

class _LanguageListTileState extends State<LanguageListTile> {
  final app = AppGetStorage();

  bool englishLanBool = false;

  bool franceBool = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () => showPlatformModalSheet(
        material: MaterialModalSheetData(
          backgroundColor: AppColors.transparent,
        ),
        context: context,
        builder: (context) => Padding(
          padding: EdgeInsets.all(14.r),
          child: Material(
            borderRadius: BorderRadius.circular(18.r),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedLanguageSquare),
      title: Text(
        EnumLocale.changeLanguage.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//-Help center
class HelpListTile extends StatelessWidget {
  const HelpListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () {},
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedHelpSquare),
      title: Text(
        EnumLocale.helpCenter.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//Privacy Settings
class PrivacyListTile extends StatelessWidget {
  const PrivacyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () {},
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedLocked),
      title: Text(
        EnumLocale.privacySettings.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//-Notification -
class NotificationListTile extends StatelessWidget {
  const NotificationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () {},
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
      leading: Icon(HugeIcons.strokeRoundedNotification01),
      title: Text(
        EnumLocale.notifications.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

//Logout-
class LogoutListTile extends StatelessWidget {
  const LogoutListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(HugeIcons.strokeRoundedLogoutSquare02),
      title: Text(
        EnumLocale.logout.name.tr,
        style: theme.bodyMedium,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () async {
        final BuildContext currentContext = context;
        await FirebaseAuth.instance.signOut();

        if (!currentContext.mounted) return;
        customLoading(context);
        await Future.delayed(Duration(milliseconds: 1500));
        Get.toNamed(AppRoutes.login);
      },
      trailing: SizedBox(width: 50.w, child: Icon(CupertinoIcons.forward)),
    );
  }
}
