import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timirama/common/constant/constant_colors.dart';
import 'package:timirama/common/constant/constant_strings.dart';
import 'package:timirama/common/localization/enums/enums.dart';
import 'package:timirama/routes/app_routes.dart';

//-Top Action (filter,create reel)-
class TopActionWdgets extends StatefulWidget {
  const TopActionWdgets({super.key});

  @override
  State<TopActionWdgets> createState() => _TopActionWdgetsState();
}

class _TopActionWdgetsState extends State<TopActionWdgets> {
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: 150.w,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    CupertinoIcons.chevron_down,
                    size: 18.sp,
                    color: AppColors.white,
                  ), // Or icon: null to completely remove it
                ),
                isExpanded: true,
                hint: Center(
                  child: Text(
                    EnumLocale.reels.name.tr,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.white,
                          fontSize: 22.sp,
                        ),
                  ),
                ),
                items: AppStrings.reelsFilterItems.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    //disable default onTap to avoid closing menu when selecting an item
                    enabled: false,
                    child: StatefulBuilder(
                      builder: (context, menuSetState) {
                        final isSelected = selectedItems.contains(item);
                        return InkWell(
                          onTap: () {
                            isSelected
                                ? selectedItems.remove(item)
                                : selectedItems.add(item);
                            //This rebuilds the StatefulWidget to update the button's text
                            setState(() {});
                            //This rebuilds the dropdownMenu Widget to update the check mark
                            menuSetState(() {});
                          },
                          child: Container(
                            height: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              children: [
                                if (isSelected)
                                  const Icon(
                                    Icons.check_box_outlined,
                                    color: AppColors.primaryColor,
                                  )
                                else
                                  const Icon(Icons.check_box_outline_blank),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 13.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
                //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
                value: selectedItems.isEmpty ? null : selectedItems.last,
                onChanged: (value) {},
                selectedItemBuilder: (context) {
                  return AppStrings.reelsFilterItems.map((item) {
                    return Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        selectedItems.join(', '),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: AppColors.white,
                              fontSize: 19.sp,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
            IconButton(
              onPressed: () => Get.toNamed(AppRoutes.add),
              icon: Icon(CupertinoIcons.camera, color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
