import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/ingredients.dart';
import 'package:xmeal/users/widgets/nutrition_value.dart';
import 'package:money_formatter/money_formatter.dart';

class WaiterViewSingleDish extends StatefulWidget {
  WaiterViewSingleDish({
    Key? key,
    required this.dishImage,
    required this.dishName,
    required this.dishRegion,
    required this.dishDescription,
    required this.dishPrice,
  }) : super(key: key);
  String? dishImage;
  String? dishName;
  String? dishRegion;
  String? dishDescription;
  String? dishPrice;

  @override
  State<WaiterViewSingleDish> createState() => _WaiterViewSingleDishState();
}

class _WaiterViewSingleDishState extends State<WaiterViewSingleDish> {
  @override
  Widget build(BuildContext context) {
    var initialPrice = double.parse(widget.dishPrice.toString());

    MoneyFormatter moneyConverter = MoneyFormatter(
        amount: initialPrice,
        settings: MoneyFormatterSettings(
          symbol: '₦',
        ));

    MoneyFormatterOutput dishAmount = moneyConverter.output;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.dishImage.toString(),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                  padding:
                      const EdgeInsets.only(top: 50, left: 7.6, right: 86.21),
                  child: IconButton(
                    color: appColour,
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
                                      children: [
                                        const Text(
                                          'Description',
                                          style: TextStyle(
                                            fontFamily: 'poppins',
                                            fontSize: 20,
                                            color: Color(0xff5E5959),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        Text(
                                          widget.dishDescription.toString(),
                                          style: const TextStyle(
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
                                          Text(
                                            dishAmount.symbolOnLeft,
                                            style: const TextStyle(
                                                fontFamily: 'poppins',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 21,
                                                color: Color(0xffFEFAF9)),
                                          ),
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
                    Positioned(
                      top: 265,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0XFF000000)
                                        .withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: const Offset(
                                      0,
                                      2,
                                    ),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 23, right: 23, top: 4, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.dishName.toString(),
                                      style: const TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.end,
                                    ),
                                    Text(
                                      widget.dishRegion.toString(),
                                      style: const TextStyle(
                                        fontFamily: 'poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff616161),
                                      ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
