import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/divider.dart';
import 'package:timirama/features/follow/screen/follow_screen.dart';
import 'package:timirama/features/reel_like/screen/reel_like_screen.dart';
import 'package:timirama/features/reels/model/reel_model.dart';

//----------------------Reel description------------------------
class ReelDescription extends StatefulWidget {
  const ReelDescription({super.key, required this.reelData});
  final ReelModel reelData;
  @override
  State<ReelDescription> createState() => _ReelDescriptionState();
}

class _ReelDescriptionState extends State<ReelDescription> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isReadMore = !isReadMore;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.0),
                Colors.black.withValues(alpha: 0.2),
                Colors.black.withValues(alpha: 0.5),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  spacing: 5.w,
                  children: [
                    CircleAvatar(
                      radius: 20.w,
                      backgroundImage:
                          widget.reelData.profileImage.isNotEmpty &&
                              Uri.tryParse(
                                    widget.reelData.profileImage,
                                  )!.hasAbsolutePath ==
                                  true
                          ? CachedNetworkImageProvider(
                              widget.reelData.profileImage,
                            )
                          : null,
                    ),
                    Text(
                      widget.reelData.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.floralWhite,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    FollowButton(id: widget.reelData.uid),
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, left: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.reelData.description,
                        maxLines: isReadMore ? 100 : 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          color: AppColors.floralWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

//-------------------Virtical icons (likes,comments,share,more)--------------------
class VirticalActionWidgets extends StatelessWidget {
  const VirticalActionWidgets({super.key, required this.reelData});
  final ReelModel reelData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Positioned(
      right: 10,
      bottom: -110,
      child: SizedBox(
        height: 450,
        // color: Colors.red.withOpacity(0.5),
        child: Column(
          spacing: 10.h,
          children: [
            ReelLikeScreen(rid: reelData.rid),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // showModalBottomSheet(
                    //     shape: BeveledRectangleBorder(),
                    //     backgroundColor: AppColors.floralWhite,
                    //     context: context,
                    //     builder: (context) => Column(
                    //           mainAxisAlignment: MainAxisAlignment.start,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Align(
                    //               alignment: Alignment.topRight,
                    //               child: PlatformIconButton(
                    //                 onPressed: () => Get.back(),
                    //                 icon: Icon(
                    //                   HugeIcons.strokeRoundedMultiplicationSign,
                    //                   color: AppColors.black,
                    //                 ),
                    //               ),
                    //             ),
                    //             SizedBox(
                    //                 height: 500.h,
                    //                 width: double.maxFinite,
                    //                 child: ListView.builder(
                    //                     itemBuilder: (context, index) =>
                    //                         SizedBox())),
                    //           ],
                    //         ));
                  },
                  icon: Icon(
                    CupertinoIcons.chat_bubble,
                    color: AppColors.white,
                    size: 30.sp,
                  ),
                  color: AppColors.white,
                ),
                Text(
                  "45k",
                  style: GoogleFonts.roboto(
                    color: AppColors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.paperPlane,
                    color: AppColors.floralWhite,
                  ),
                  color: AppColors.floralWhite,
                ),
                Text(
                  '75k',
                  style: GoogleFonts.roboto(
                    color: AppColors.floralWhite,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () => showPlatformModalSheet(
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
                      children: [
                        ListTile(
                          onTap: () {
                            Get.back();
                          },
                          leading: Icon(HugeIcons.strokeRoundedArchive),
                          title: Text(
                            EnumLocale.archive.name.tr,
                            style: theme.bodyMedium,
                          ),
                        ),
                        CustomDivider(),
                        ListTile(
                          onTap: () {
                            Get.back();
                          },
                          leading: Icon(Icons.favorite_outline),
                          title: Text(
                            EnumLocale.favorites.name.tr,
                            style: theme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              icon: Icon(
                Icons.more_vert_outlined,
                color: AppColors.floralWhite,
                size: 30.sp,
              ),
              color: AppColors.floralWhite,
            ),
          ],
        ),
      ),
    );
  }
}
