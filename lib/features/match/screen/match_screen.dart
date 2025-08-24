import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/features/match/screen/card_screen.dart';
import 'package:timirama/features/match/screen/error_screen.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return switch (state) {
          // Initial state 
          Loading() => CustomCircularIndicator(),
          // Error Occure
          Error() => ErrorWhileFetching(),

          // Swipe card
          _ => CardScreen(),
        };
      },
    );
  }
}
