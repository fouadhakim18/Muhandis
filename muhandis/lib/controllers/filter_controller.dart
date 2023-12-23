import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  var dateRange = RangeValues(0, 100).obs;
  var priceRange = RangeValues(0, 10000).obs;
}
