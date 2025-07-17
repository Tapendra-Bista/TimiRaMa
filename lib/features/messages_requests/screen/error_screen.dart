import 'package:flutter/material.dart';

//-----------Error while fetching data---------------
class ErrorInRequestFetch extends StatelessWidget {
  const ErrorInRequestFetch({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        errorMessage,
        style: theme.bodyMedium,
      ),
    );
  }
}
