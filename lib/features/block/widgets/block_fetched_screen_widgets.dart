import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/block/bloc/block_bloc.dart';
import 'package:timirama/features/block/bloc/block_event.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_event.dart';
import 'package:timirama/features/profile/model/profile_model.dart';

// user Image
class UserImage extends StatelessWidget {
  const UserImage({super.key, required this.Homedata});
  final ProfileModel? Homedata;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.r,
      backgroundImage: CachedNetworkImageProvider(Homedata!.imgURL),
    );
  }
}

// block User Name
class UserName extends StatelessWidget {
  const UserName({super.key, required this.profileModel});

  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Text(
      profileModel.pseudo,
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// block User Name
class UnBlockedButton extends StatelessWidget {
  const UnBlockedButton({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<BlockBloc>().add(
              BlockUserRemoved(blockId: profileModel.id),
            );
        context.read<HomeBloc>().add(HomeUsersProfileList());

        snackBarMessage(
          context,
          "${profileModel.pseudo} ${EnumLocale.removedFromBlock.name.tr}",
          Theme.of(context),
        );
      },
      child: Text(
        EnumLocale.unblock.name.tr,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
