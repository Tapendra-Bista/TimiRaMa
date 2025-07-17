import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timirama/features/messages_requests/bloc/request_receiver_bloc.dart';
import 'package:timirama/features/messages_requests/screen/error_screen.dart';
import 'package:timirama/features/messages_requests/screen/no_requests.dart';
import 'package:timirama/features/messages_requests/screen/requests_users_screen.dart';


//-------Received---------------
class View1 extends StatefulWidget {
  const View1({super.key});

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  @override
  void initState() {
    context.read<RequestReceiverBloc>().add(RequestReceiverGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocBuilder<RequestReceiverBloc, RequestReceiverState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return switch (state) {
            ErrorInRequests(:final errorMessage) => ErrorInRequestFetch(
              errorMessage: errorMessage,
            ),
            NoRequestsYet() => NoRequests(),
            _ => RequestsReceiverScreen(),
          };
        },
      ),
    );
  }
}
