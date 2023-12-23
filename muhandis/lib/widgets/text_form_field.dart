import 'package:flutter/material.dart';

Widget TextFormFieldd(
    {required IconData prefixIcon,
    required String hint,
    required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1, // Border width
      ),
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                // floatingLabelBehavior: FloatingLabelBehavior.auto,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 13.0, horizontal: 18.0),
                hintText: hint,
                hintStyle: TextStyle(fontSize: 13),
                border: InputBorder.none,
                prefixIcon: Icon(prefixIcon)),
          ),
        ),
      ],
    ),
  );
}
