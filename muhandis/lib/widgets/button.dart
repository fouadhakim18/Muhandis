import 'package:flutter/material.dart';
import 'package:muhandis/consts/colors.dart';

class Button extends StatelessWidget {
  Color? color;
  final String text;
  final double size;
  Color? textColor;
  Color? borderColor;
  VoidCallback clicked;
  Button(
      {super.key,
      this.color = AppColors.mainColor,
      this.textColor = Colors.white,
      this.borderColor = AppColors.mainColor,
      required this.text,
      this.size = 15,
      required this.clicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: clicked,
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: borderColor!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: color,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: size,
                // fontFamily: AppStyles.semibold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
