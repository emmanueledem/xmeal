import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/positioned_dish_name.dart';
import 'package:xmeal/users/widgets/ingredients.dart';
import 'package:xmeal/users/widgets/nutrition_value.dart';
import 'package:xmeal/users/widgets/positioned_dish_favorite_icon.dart';

class ViewSingleDish extends StatelessWidget {
  const ViewSingleDish({Key? key}) : super(key: key);
  static const id = 'view_single_dish';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage('assets/images/view_screen.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 262,
                  ),
                  child: Container(
                    width: 118,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E3311).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Stack(
                            children: const [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Color(0xffC4C4C4),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Color(0xffC4C4C4),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '4.5',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xffFFFFFF),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80.67, left: 7.6, right: 86.21),
                  child: IconButton(
                    color: const Color(0xffFEFAF9),
                    iconSize: 35.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 280),
                      child: Container(
                        height: 500,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 31, right: 25),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 52,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Description',
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 20,
                                            color: Color(0xff5E5959),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          'Our fried rice is made from the finest ingredients and veggies. single dish is made with fresh vegetables, rescued.',
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 10,
                                            color: Color(0xff5E5959),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Nutritional Value',
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 13,
                                            color: Color(0xff5E5959),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Divider(
                                            color: Color(0xff5D5959),
                                            thickness: 1,
                                            height: 1,
                                          ),
                                        ),
                                        NutritionValue(
                                          title: 'Protein',
                                          value: '2.5g',
                                        ),
                                        NutritionValue(
                                          title: 'Carbohydrates',
                                          value: '14.7g',
                                        ),
                                        NutritionValue(
                                          title: 'Potassium',
                                          value: '5%',
                                        ),
                                        NutritionValue(
                                          title: 'Sodium',
                                          value: '19%',
                                        ),
                                        NutritionValue(
                                          title: 'Rich in Vitamin A,C and B3',
                                          value: '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x14000000),
                                      spreadRadius: 0,
                                      blurRadius: 7,
                                      offset: Offset(
                                        0,
                                        2,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 28,
                                        top: 15,
                                      ),
                                      child: Text(
                                        'Ingredients',
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff797979),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 19.55,
                                          right: 19.55,
                                          bottom: 10.35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Ingredients(
                                            image: AssetImage(
                                                'assets/images/ingredient1.png'),
                                          ),
                                          Ingredients(
                                            image: AssetImage(
                                                'assets/images/ingredient2.png'),
                                          ),
                                          Ingredients(
                                            image: AssetImage(
                                                'assets/images/ingredient3.png'),
                                          ),
                                          Ingredients(
                                            image: AssetImage(
                                                'assets/images/ingredient4.png'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColour,
                                  borderRadius: BorderRadius.circular(28),
                                  border: Border.all(
                                      color: const Color(0xffFF785B),
                                      style: BorderStyle.solid,
                                      width: 1),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x40000000),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: Offset(
                                        0,
                                        2,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 28,
                                        top: 12,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 19.55,
                                          right: 19.55,
                                          bottom: 10.35),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text(
                                            '₹100',
                                            style: TextStyle(
                                                fontFamily: 'poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 21,
                                                color: Color(0xffFEFAF9)),
                                          ),
                                          Container(
                                            height: 34,
                                            width: 128.42,
                                            decoration: BoxDecoration(
                                              color: appColour,
                                              borderRadius:
                                                  BorderRadius.circular(28),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 1),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: const [
                                                Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 21,
                                                    color: Color(0xffFEFBFA),
                                                  ),
                                                ),
                                                Text(
                                                  '1',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 21,
                                                    color: Color(0xffFEFBFA),
                                                  ),
                                                ),
                                                Text(
                                                  '+',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 21,
                                                    color: Color(0xffFEFBFA),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Image(
                                            width: 31.85,
                                            height: 31,
                                            image: AssetImage(
                                                'assets/images/add_to_cart.png'),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const PositionedDishName(),
                  ],
                ),
                const Positionedfavoriteicon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
