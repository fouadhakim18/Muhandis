import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/controllers/filter_controller.dart';

Widget priceRange() {
  // RangeValues _dateRange = RangeValues(0, 100);
  final controller = Get.put(FilterController());

  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: RangeSlider(
            values: controller.priceRange.value,
            min: 0,
            max: 10000,
            divisions: 100,
            onChanged: (RangeValues values) {
              controller.priceRange.value = values;
              print(controller.priceRange.value);
            },
            labels: RangeLabels(
              '${controller.priceRange.value.start} DA',
              '${controller.priceRange.value.end.round()} DA',
            ),
            activeColor: AppColors.mainColor,
          ),
        ),
        // SizedBox(height: 20),
      ],
    ),
  );
}
