import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/features/wellcome/bloc/wellcome_bloc.dart';
import 'package:timirama/features/wellcome/widget/wellcome_widget.dart';
import 'package:timirama/services/service_locator/service_locator.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider<WellcomeBloc>.value(
            value: getIt<WellcomeBloc>(),
            child: BlocListener<WellcomeBloc, WellcomeState>(
              listener: _listener,
              // Sync with GetX,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ).copyWith(bottom: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    SizedBox(height: 20.h),
                    //-----------------Wellcome Text    and  langugage selector drop down-----------------------------
                    const WellcomeTextAndDropDown(),
                    //-------------------center image logo----------------------------
                    const CenterImage(),
                    //--------------------Welcome page description----------------------------
                    const WelcomeDescription(),

                    SizedBox(height: 35.h),
                    //------------------------Next Button ----------------------------------
                    NextButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listener(context, state) async {}
}
