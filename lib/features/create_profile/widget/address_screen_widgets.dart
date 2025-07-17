import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/common/widgets/snackbar_message.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_event.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_state.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/location/location.dart';
import 'package:timirama/services/permissions/permission_handler.dart';
import 'package:timirama/services/storage/get_storage.dart';

//--------------- Address page components------------------------------

//--------------------Next Button------------------------
class AddressNextButton extends StatelessWidget {
  AddressNextButton({super.key});

  final AppGetStorage app = AppGetStorage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      builder: (context, state) {
        return CommonButton(
          onPressed: () async {
            final BuildContext currentContext = context;

            final isGranted = await AppPermission.requestLocationPermission();

            if (!currentContext.mounted) return;

            if (isGranted) {
              app.setPageNumber(6);

              Get.toNamed(AppRoutes.interests);
            } else {
              snackBarMessage(
                currentContext,
                EnumLocale.locationPermissionRequired.name.tr,
                Theme.of(currentContext),
              );
            }
          },
          buttonText: EnumLocale.next.name.tr,
        );
      },
    );
  }
}

//----------------Text Regarding Address description--------------------------
class AddressDescription extends StatelessWidget {
  const AddressDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.addressDescription.name.tr, style: theme.bodySmall);
  }
}

//----------------Text Regarding Address Title--------------------------
class AddressTitle extends StatelessWidget {
  const AddressTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.addressTitle.name.tr, style: theme.bodyLarge);
  }
}

//-------------------User Location----------------------------
class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<Placemark>?> _getLocation() async {
      bool isGranted = await AppPermission.requestLocationPermission();

      if (!isGranted) {
        await AppPermission.requestLocationPermission();
        return null;
      } else {
        final Position position = await UserLocation.determinePosition();
        return await UserLocation.geoCoding(position);
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CountryText(),
        Country(locationFuture: _getLocation()), // call fresh each time
        SizedBox(height: 5.h),
        CityText(),
        City(locationFuture: _getLocation()), // call fresh each time
      ],
    );
  }
}

//------------------City name----------------------
class City extends StatelessWidget {
  const City({super.key, required Future<List<Placemark>?>? locationFuture})
      : _locationFuture = locationFuture;

  final Future<List<Placemark>?>? _locationFuture;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return FutureBuilder<List<Placemark>?>(
      future: _locationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'Loading',
            style: theme.bodySmall,
          ); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}", style: theme.bodySmall);
        } else if (snapshot.hasData && snapshot.data != null) {
          final currentLocation = snapshot.data!;
          return Container(
            height: 40.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                currentLocation.first.locality!.tr,
                style: theme.bodyMedium,
              ),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

//------------Country Name-----------------
class Country extends StatelessWidget {
  const Country({super.key, required Future<List<Placemark>?>? locationFuture})
      : _locationFuture = locationFuture;

  final Future<List<Placemark>?>? _locationFuture;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return FutureBuilder<List<Placemark>?>(
      future: _locationFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            'Loading',
            style: theme.bodySmall,
          ); // Show loading indicator
        } else if (snapshot.hasError) {
          return Text(" ${snapshot.error}", style: theme.bodySmall);
        } else if (snapshot.hasData && snapshot.data != null) {
          final currentLocation = snapshot.data!;
          context.read<CreateProfileBloc>().add(
                AddressChanged(
                  country: currentLocation.first.country!,
                  city: currentLocation.first.locality!,
                ),
              );
          return Container(
            height: 40.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.primaryColor, width: 1.w),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                currentLocation.first.country!.tr,
                style: theme.bodyMedium,
              ),
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}

//--------------City  Text-----------------
class CityText extends StatelessWidget {
  const CityText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      "${EnumLocale.cityName.name.tr} :",
      style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
    );
  }
}

//-------------------Country     Text----------------------
class CountryText extends StatelessWidget {
  const CountryText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      "${EnumLocale.countryName.name.tr} :",
      style: theme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
