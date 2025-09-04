import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_state.dart';
import 'package:timirama/features/favorite/widgets/favorite_fetched_screen_widgets.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

// Optimized with RepaintBoundary and const constructors
class FetchedScreen extends StatelessWidget {
  const FetchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocSelector<FavoriteBloc, FavoriteState, List<ProfileModel>>(
      selector: (state) => state.favUserList,
      builder: (context, favData) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            material: (context, platform) {
              return MaterialAppBarData(centerTitle: true);
            },
            leading: PlatformIconButton(
              onPressed: () => Get.back(),
              icon: const Icon(HugeIcons.strokeRoundedMultiplicationSign),
            ),
            title: Text(EnumLocale.favorites.name.tr, style: theme.bodyMedium),
          ),
          body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            itemCount: favData.length,
            itemBuilder: (context, index) {
              final item = favData[index];
              final hasValidUrl = item.imgURL.isNotEmpty &&
                  Uri.tryParse(item.imgURL)?.hasAbsolutePath == true;

              if (!hasValidUrl) return const SizedBox.shrink();

              return RepaintBoundary(
                child: Container(
                  key: ValueKey(
                      item.id), // Add unique key for better performance
                  margin: EdgeInsets.only(bottom: 10.h),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.greyContainerColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.h,
                    children: [
                      UserImage(Homedata: item),
                      CreatedDate(Homedata: item),
                      ButtonsList(Homedata: item),
                      UserDetails(profileModel: item),
                      Interests(profileModel: item),
                      Description(profileModel: item),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
