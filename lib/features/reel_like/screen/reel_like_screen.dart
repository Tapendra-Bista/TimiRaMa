import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_bloc.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_event.dart';
import 'package:timirama/features/reel_like/bloc/reel_like_state.dart';
import 'package:timirama/features/reel_like/model/reel_like_model.dart';

class ReelLikeScreen extends StatelessWidget {
  final String rid;
  const ReelLikeScreen({super.key, required this.rid});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ReelLikeBloc, ReelLikeState, ReelLikeModel>(
      selector: (state) => state.reelLikeUserList,
      builder: (context, reelLikeData) {
        return Column(
          children: [
            IconButton(
              onPressed: () {
                if (reelLikeData.reelLikeId.contains(rid)) {
                  context.read<ReelLikeBloc>().add(
                        ReelLikeUserRemoved(reelLikeId: rid),
                      );
                  debugPrint("unReelLike  ${rid}");
                } else {
                  context.read<ReelLikeBloc>().add(
                        ReelLikeUserAdded(reelLikeId: rid),
                      );
                  debugPrint("ReelLike  ${rid}");
                }
              },
              icon: Icon(
                reelLikeData.reelLikeId.contains(rid)
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: reelLikeData.reelLikeId.contains(rid)
                    ? Colors.red
                    : AppColors.white,
                size: 30.sp,
              ),
              color: AppColors.white,
            ),
            Text(
              "21k",
              style: GoogleFonts.roboto(color: AppColors.white, fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
