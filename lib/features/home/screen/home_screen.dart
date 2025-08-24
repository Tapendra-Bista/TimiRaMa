import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/features/home/bloc/home_bloc.dart';
import 'package:timirama/features/home/bloc/home_state.dart';
import 'package:timirama/features/home/screen/error_home_screen.dart';
import 'package:timirama/features/home/screen/home_data_fetched_screen.dart';

import 'home_data_is_empty.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return switch (state) {
          //-Loading
          Loading() => const CustomCircularIndicator(),
          // Get Error
          Error() => const HomeErrorContent(),
          //Empty Data
          HomeDataIsEmpty() => NoData(),
          //After Data Fetched
          _ => const HomeDataContent(),
        };
      },
    );
  }
}
