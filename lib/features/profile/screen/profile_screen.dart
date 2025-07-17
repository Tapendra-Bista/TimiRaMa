import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/features/profile/bloc/profile_bloc.dart';
import 'package:timirama/features/profile/screen/error_screen.dart';
import 'package:timirama/features/profile/screen/fetch_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return switch (state) {
          //----------Loading--------------------
          Loading() => const CustomCircularIndicator(),
          //----------------- Get Error--------------------
          Error() => const ProfileErrorContent(),
          //---------------After Data Fetched--------------------
          ProfileLoaded() => const ProfileDataContent(),
          //----- default----
          _ => SizedBox.square(),
        };
      },
    );
  }
}
