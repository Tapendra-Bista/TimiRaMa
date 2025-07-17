// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timirama/common/widgets/seniority.dart';
import 'package:timirama/features/profile/model/profile_model.dart';
import 'package:timirama/features/user_details/widgets/user_details_widgets.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({super.key, required this.data});
  final ProfileModel data;
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  bool _isScrollingUp = false;
  double _previousOffset = 0;

  @override
  Widget build(BuildContext context) {
    final date = Seniority.formatJoinedTime(widget.data.createdDate.toDate());
    final hasValidUrl = widget.data.imgURL.isNotEmpty &&
        Uri.tryParse(widget.data.imgURL)?.hasAbsolutePath == true;
    return PlatformScaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            final currentOffset = notification.metrics.pixels;

            setState(() {
              _isScrollingUp = currentOffset < _previousOffset;
              _previousOffset = currentOffset;
            });
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            //----------------------PlatformAppBar------------------------------
            UserDetailsPlatformAppBar(
              isScrollingUp: _isScrollingUp,
              data: widget.data,
            ),
            StackWidget(hasValidUrl: hasValidUrl, widget: widget),

            //-------------age of account-----------------------
            CreatedDate(
              date: date,
              id: widget.data.id,
            ),
            SliverToBoxAdapter(child: SizedBox(height: 5.h)),
            //-----------------RowList of Button------------------------
            ButtonList(model: widget.data),
            //------User  Details like name , age city------------------------
            SliverToBoxAdapter(child: SizedBox(height: 5.h)),
            UserDetails(widget: widget),
            SliverToBoxAdapter(child: SizedBox(height: 5.h)),
            // Interests grid-----------------------
            Interests(widget: widget),

            //---------User description-----------------------
            Description(widget: widget),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          ],
        ),
      ),
    );
  }
}
