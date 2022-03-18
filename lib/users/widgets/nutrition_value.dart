import 'package:flutter/material.dart';

class NutritionValue extends StatelessWidget {
 const NutritionValue({Key? key, 
    required this.title,
    required this.value,
  }) : super(key: key);
final  String? title;
 final String? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title.toString(),
          style: const TextStyle(
              color: Color(0xff0F0C0C),
              fontWeight: FontWeight.w300,
              fontSize: 9),
        ),
        Text(
          value.toString(),
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
