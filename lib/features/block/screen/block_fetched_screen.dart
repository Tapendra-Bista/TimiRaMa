import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_state.dart';
import 'package:timirama/features/block/widgets/block_fetched_screen_widgets.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

// Optimized with RepaintBoundary and const constructors
class FetchedScreen extends StatelessWidget {
  const FetchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return BlocSelector<BlockBloc, BlockState, List<ProfileModel>>(
      selector: (state) => state.blockUserList,
      builder: (context, blockData) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            material: (context, platform) {
              return MaterialAppBarData(centerTitle: true);
            },
            leading: PlatformIconButton(
              onPressed: () => Get.back(),
              icon: const Icon(HugeIcons.strokeRoundedMultiplicationSign),
            ),
            title: Text(EnumLocale.blocked.name.tr, style: theme.bodyMedium),
          ),
          body: CustomScrollView(
            slivers: [
              //divider
              const SliverToBoxAdapter(child: CustomDivider()),
              SliverList.builder(
                itemCount: blockData.length,
                itemBuilder: (context, index) {
                  final item = blockData[index];
                  final hasValidUrl = item.imgURL.isNotEmpty &&
                      Uri.tryParse(item.imgURL)?.hasAbsolutePath == true;

                  if (!hasValidUrl) return const SizedBox.shrink();

                  return hasValidUrl
                      ? RepaintBoundary(
                          child: Column(
                            key: ValueKey(item
                                .id), // Add unique key for better performance
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.h,
                                  horizontal: 2.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      spacing: 8.w,
                                      children: [
                                        //User Image
                                        UserImage(Homedata: item),
                                        //User name
                                        UserName(profileModel: item),
                                      ],
                                    ),
                                    //Button
                                    UnBlockedButton(profileModel: item),
                                  ],
                                ),
                              ),
                              //divider
                              const CustomDivider(),
                            ],
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
