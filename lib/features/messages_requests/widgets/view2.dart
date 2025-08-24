import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_sender_bloc.dart';
import 'package:timirama/features/messages_requests/screen/error_screen.dart';
import 'package:timirama/features/messages_requests/screen/no_requests.dart';
import 'package:timirama/features/messages_requests/screen/requests_users_screen.dart';

//Sent-
class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  @override
  void initState() {
    context.read<RequestSenderBloc>().add(TotalRequestSenderSend());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<RequestSenderBloc, RequestSenderState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return switch (state) {
            ErrorInRequests(:final errorMessage) => ErrorInRequestFetch(
                errorMessage: errorMessage,
              ),
            NoRequestsYet() => NoRequests(),
            _ => RequestsSenderScreen(),
          };
        },
      ),
    );
  }
}
