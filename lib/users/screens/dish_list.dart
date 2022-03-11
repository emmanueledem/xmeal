import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/styles/constants.dart';

class Dish_list extends StatelessWidget {
  const Dish_list({Key? key}) : super(key: key);
  static const id = 'Dish_categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextFormField(
                  decoration: KinputdecorationStyle.copyWith(
                    hintText: 'Search a categories',
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, view_single_dish.id);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Image(
                                image: AssetImage(
                                  'assets/images/home_scroll_img3.png',
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Fried Rice',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                    Text(
                                      '19,000',
                                      style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 15.6278,
                                          color: appColour),
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
