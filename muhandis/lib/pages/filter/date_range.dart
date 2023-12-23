import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/consts/colors.dart';
import 'package:muhandis/controllers/filter_controller.dart';

Widget dateRange() {
  // RangeValues _dateRange = RangeValues(0, 100);
  final controller = Get.put(FilterController());
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Start Date: ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${DateTime.now().subtract(Duration(days: (365 - controller.dateRange.value.start).round())).toString().substring(0, 10)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: RangeSlider(
            values: controller.dateRange.value,

            min: 0,
            max: 365, // Assuming 365 days in a year for range
            onChanged: (RangeValues values) {
              controller.dateRange.value = values;
            },
            divisions: 365, // Number of intervals
            labels: RangeLabels(
              '${controller.dateRange.value.start.round()} days', // Format labels as needed
              '${controller.dateRange.value.end.round()} days',
            ),
            activeColor: AppColors.mainColor,
          ),
        ),
        // SizedBox(height: 20),
        Row(
          children: [
            Text(
              "End Date: ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              '${DateTime.now().subtract(Duration(days: (365 - controller.dateRange.value.end).round())).toString().substring(0, 10)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}
