import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';
import 'package:timirama/features/reels/screen/error_in_reel.dart';
import 'package:timirama/features/reels/screen/no_reel_data.dart';
import 'package:timirama/features/reels/screen/reel_view_screen.dart';
import 'package:timirama/features/reels/widget/top_action_widgets.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});
  //-------------------Reels Screen------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ReelBloc, ReelState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            return switch (state) {
              ReelError() => const ErrorInReel(),
              ReelEmpty() => const NoReelAvailable(),
              _ => const Stack(
                children: [
                  //-----------Reel View-------------------
                  const ReelsView(),
                  //----------------Top Action----------
                  const TopActionWdgets(),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}
