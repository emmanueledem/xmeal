import 'package:flutter/material.dart';

class First_Home_screen_Container extends StatelessWidget {
  const  First_Home_screen_Container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffFB6A70),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Rescued Food',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23.95,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Saving food and hunger.',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'poppins',
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Left over food and supplies are gathered from food venders and chefs, and are sold for 50% off! ',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'poppins',
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              const Image(
                image: AssetImage(
                  'assets/images/home_scroll_img1.png',
                ),
                height: 155,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
