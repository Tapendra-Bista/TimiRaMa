import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/reels/bloc/reel_bloc.dart';

class ErrorInReel extends StatelessWidget {
  const ErrorInReel({super.key});
  //-----------Error While fetching------------
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocSelector<ReelBloc, ReelState, String?>(
      selector: (state) {
        if (state is ReelError) return state.errorMessage;

        return null;
      },
      builder: (context, error) {
        return Center(
          child: Text(
            error ?? "",
            style: theme.bodyMedium,
          ),
        );
      },
    );
  }
}
