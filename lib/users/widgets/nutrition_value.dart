import 'package:flutter/material.dart';

class Nutrition_Value extends StatelessWidget {
  Nutrition_Value({
    required this.nutrition_name,
    required this.nutrition_value,
  });
  String? nutrition_name;
  String? nutrition_value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          nutrition_name.toString(),
          style: const TextStyle(
              color: Color(0xff0F0C0C),
              fontWeight: FontWeight.w300,
              fontSize: 9),
        ),
        Text(
          nutrition_value.toString(),
          textAlign: TextAlign.end,
          style: const TextStyle(
              fontFamily: 'poppins', fontWeight: FontWeight.w500, fontSize: 9),
        ),
        const SizedBox(
          height: 3,
        )
      ],
    );
  }
}
