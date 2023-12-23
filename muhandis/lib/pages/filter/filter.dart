import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muhandis/controllers/filter_controller.dart';
import 'package:muhandis/pages/filter/date_range.dart';
import 'package:muhandis/pages/filter/filtered_internships.dart';
import 'package:muhandis/pages/filter/price_range.dart';
import 'package:muhandis/pages/home/home.dart';
import 'package:muhandis/widgets/button.dart';
import 'package:muhandis/widgets/text_form_field.dart';

import '../../consts/colors.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int _selectedIndexStar = -1;

  // String selecteditem = LoadServices.serviceDisplay[0];
  TextEditingController locationController = TextEditingController();
  final controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 4,
                width: 90,
                decoration: BoxDecoration(
                    color: const Color(0xffD0D0D0),
                    borderRadius: BorderRadius.circular(13)),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Set filters',
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Location ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormFieldd(
                prefixIcon: Icons.location_on_outlined,
                hint: "Location",
                controller: locationController),
            const SizedBox(
              height: 25,
            ),
            dateRange(),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Price ',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            priceRange(),
            const SizedBox(height: 20),
            Button(
                text: "Apply Filters",
                clicked: () {
                  Get.to(() => FilteredInternships(
                        location: locationController.text,
                      ));
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
