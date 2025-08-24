import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/common/utils/validators.dart';
import 'package:timirama/common/widgets/common_button.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_bloc.dart';
import 'package:timirama/features/create_profile/bloc/create_profile_event.dart';
import 'package:timirama/routes/app_routes.dart';
import 'package:timirama/services/storage/get_storage.dart';

// Description screen componets

//-Text Regarding name description
class DescriptionBody extends StatelessWidget {
  const DescriptionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.descriptionBody.name.tr, style: theme.bodySmall);
  }
}

//-Text Regarding name Title
class DescriptionTitle extends StatelessWidget {
  const DescriptionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(EnumLocale.descriptionTitle.name.tr, style: theme.bodyLarge);
  }
}

//Textfield for user input for description
class TextFieldForDescription extends StatefulWidget {
  const TextFieldForDescription({super.key});

  @override
  State<TextFieldForDescription> createState() =>
      _TextFieldForDescriptionState();
}

class _TextFieldForDescriptionState extends State<TextFieldForDescription> {
  final discriptionController = TextEditingController();

  @override
  void dispose() {
    discriptionController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 100.h,
      child: TextFormField(
        scrollPadding: EdgeInsets.zero,
        expands: true, // Fills available vertical space
        maxLines: null, // Must be null when expands is true
        minLines: null,
        keyboardType: TextInputType.text,
        onChanged: (value) => context.read<CreateProfileBloc>().add(
              DescriptionChanged(description: value.trim()),
            ),
        cursorColor: AppColors.black,
        style: TextStyle(fontSize: 16),
        validator: AppValidator.validateDescription,
        controller: discriptionController,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          errorMaxLines: 3,
          labelText: EnumLocale.descriptionLabelText.name.tr,
          labelStyle: theme.bodySmall,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 2.w, color: AppColors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 1.w, color: AppColors.blue),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(width: 2.w, color: AppColors.red),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

//Next Button

class DescriptionNextButton extends StatelessWidget {
  DescriptionNextButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  final AppGetStorage app = AppGetStorage();

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          app.setPageNumber(9);
          Get.toNamed(AppRoutes.upload);
        }
      },
      buttonText: EnumLocale.next.name.tr,
    );
  }
}
