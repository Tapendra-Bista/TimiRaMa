import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/features/messages_requests/widgets/messages_requests_screen_widgets.dart';
import 'package:timirama/features/messages_requests/widgets/tabs_list_widgets.dart';
import 'package:timirama/features/messages_requests/widgets/view1.dart';
import 'package:timirama/features/messages_requests/widgets/view2.dart';

class RequestSenderScreen extends StatelessWidget {
  const RequestSenderScreen({super.key});

  //----------------------- Message Requests Screen-------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: RequestSenderAppBar(),
      ),
      body: ContainedTabBarView(
        tabBarViewProperties: const TabBarViewProperties(
          physics: NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
        ),
        tabBarProperties: TabBarProperties(
          indicatorColor: AppColors.primaryColor,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: const [Tab1(), Tab2()],
        views: const [View1(), View2()],
      ),
    );
  }
}
