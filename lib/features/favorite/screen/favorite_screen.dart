import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/common/widgets/circular_indicator.dart';
import 'package:timirama/features/favorite/bloc/favorite_bloc.dart';
import 'package:timirama/features/favorite/bloc/favorite_state.dart';
import 'package:timirama/features/favorite/screen/empty_data_screen.dart';
import 'package:timirama/features/favorite/screen/error_screen.dart';
import 'package:timirama/features/favorite/screen/favorite_fetched_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  //-----------------------------Fav Screeen----------------------------------------
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return switch (state) {
          //-----------initial loading---------------------------
          FavoriteUsersLoading() => const CustomCircularIndicator(),
          //------------------Error Screening -----------------------------
          FavoriteUsersError() => const ErrorScreen(),
          //------------empty---------------
          FavoriteDataEmpty() => const NoData(),
          //-------------Data Fetch screen -------------------
          _ => const FetchedScreen(),
        };
      },
    );
  }
}
