import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/dish_list_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/Home_screen_Containers.dart';
import 'package:xmeal/users/widgets/favorite_dishes.dart';
import 'package:xmeal/users/widgets/viewed_dishes.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        iconTheme: const IconThemeData(color: appColour, size: 28),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Xmeal',
          style: TextStyle(
            color: appColour,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'poppins',
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.shopping_cart,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Happy Deals',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  const Text(
                    'Relish a big bing with our biggest offers',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: const [
                      First_Home_screen_Container(),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Favorite Dishes:',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  Container(
                    height: 138.2,
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Favorite_Dishes(
                          image: const AssetImage(
                            'assets/images/first_welcome_image.png',
                          ),
                          dishName: 'Spaghetti',
                          region: 'Nigeria',
                          dateAdded: 'Yesterday 3pm',
                          price: '৳1250',
                        ),
                        Favorite_Dishes(
                          image: const AssetImage(
                            'assets/images/home_scroll_img3.png',
                          ),
                          dishName: 'Fried Rice',
                          region: 'Nigeria',
                          dateAdded: 'Thurday 3pm',
                          price: '৳1250',
                        ),
                        Favorite_Dishes(
                          image: const AssetImage(
                            'assets/images/home_scroll_img1.png',
                          ),
                          dishName: 'Coach Sncak',
                          region: 'Nigeria',
                          dateAdded: '09/23/2022',
                          price: '৳1250',
                        ),
                        Favorite_Dishes(
                          image: const AssetImage(
                            'assets/images/home_scroll_img2.png',
                          ),
                          dishName: 'Noddles',
                          region: 'Nigeria',
                          dateAdded: 'Today 12:30pm',
                          price: '৳1245',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                      height: 10,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Dish_list_screen.id);
                      },
                      minWidth: 365,
                      height: 51,
                      textColor: Colors.white,
                      color: appColour,
                      child: const Text(
                        'Find a Dish >>',
                        style: TextStyle(
                            color: Color(
                              0xffF6F6F9,
                            ),
                            fontSize: 17,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey.shade300,
                      height: 10,
                    ),
                  ),
                  const Text(
                    'Viewed Dishes:',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  Container(
                    height: 274.09,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: <Widget>[
                        Viewed_dishes(
                          image: const AssetImage(
                            'assets/images/img5.png',
                          ),
                          dishName: 'Fried Rice',
                          region: 'Nigeria',
                          price: '৳1250',
                        ),
                        Viewed_dishes(
                          image: const AssetImage(
                            'assets/images/img2.png',
                          ),
                          dishName: 'Fried Rice',
                          region: 'Nigeria',
                          price: '৳1250',
                        ),
                        Viewed_dishes(
                          image: const AssetImage(
                            'assets/images/img6.png',
                          ),
                          dishName: 'Fried Rice',
                          region: 'Nigeria',
                          price: '৳1250',
                        ),
                        Viewed_dishes(
                          image: const AssetImage(
                            'assets/images/img12.png',
                          ),
                          dishName: 'Fried Rice',
                          region: 'Nigeria',
                          price: '৳1250',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Text('Happy Deals')
          ],
        ),
      ),
    );
  }
}
