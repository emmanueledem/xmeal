import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/home_screen_favorite_dishes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? const FavoriteScreenContent()
        : Login();
  }
}

class FavoriteScreenContent extends StatelessWidget {
  const FavoriteScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Your Favorites',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins',
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 17, top: 8.0),
                        child: FavoriteDishes(
                          image: AssetImage(
                            'assets/images/first_welcome_image.png',
                          ),
                          dishName: 'Spaghetti',
                          region: 'Nigeria',
                          dateAdded: 'Yesterday 3pm',
                          price: '৳1250',
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.pushNamed(context, ViewSingleDish.id);
                      // },
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 17, top: 8.0),
                        child: FavoriteDishes(
                          image: AssetImage(
                            'assets/images/second_welcome_image.png',
                          ),
                          dishName: 'Spaghetti',
                          region: 'Nigeria',
                          dateAdded: 'Yesterday 3pm',
                          price: '৳1250',
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.pushNamed(context, ViewSingleDish.id);
                      // },
                    ),
                    GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 17, top: 8.0),
                        child: FavoriteDishes(
                          image: AssetImage(
                            'assets/images/third_welcome_image.png',
                          ),
                          dishName: 'Spaghetti',
                          region: 'Nigeria',
                          dateAdded: 'Yesterday 3pm',
                          price: '৳1250',
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.pushNamed(context, ViewSingleDish.id);
                      // },
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
