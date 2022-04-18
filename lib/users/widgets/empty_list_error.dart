import 'package:flutter/material.dart';

class EmptyListError extends StatelessWidget {
   EmptyListError({
    Key? key,
    required this.errorText,
  }) : super(key: key);
 final String? errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
              const  Image(
                    height: 130,
                    width: 130,
                    image: AssetImage('assets/images/userImage.png')),
                Text(
                  errorText.toString(),
                
                  style: const TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20.0,
                      letterSpacing: -0.03,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
