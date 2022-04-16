import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/dishes_provider.dart';
import 'package:xmeal/users/screens/dish_list_screen.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/notification_screen.dart';
import 'package:xmeal/services/providers/user_profile_provider.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/home_screen_containers.dart';
import 'package:xmeal/users/widgets/home_screen_favorite_dishes.dart';

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  // List<String>? viewedDishList;
  @override
  void initState() {
    super.initState();
    _handleUser();
  }

  User? loggedInUser;
  final _auth = FirebaseAuth.instance;
  Future<void> _handleUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      await Provider.of<ProfileProvider>(context, listen: false)
          .fetchUserData();

      (await Provider.of<DishesProvider>(context, listen: false)
              .fetchViewedDishes())
          ?.cast<String>();

      (await Provider.of<DishesProvider>(context, listen: false)
              .fetchFavoriteDishes())
          ?.cast<String>();
    }
  }

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
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context,
                loggedInUser == null ? Login.id : NotificationScreen.id),
            child: loggedInUser != null
                ? const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.notifications,
                      size: 28,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 16, right: 15),
                    child: Text(
                      'Login/Sign-Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<DishesProvider>(
          builder: (context, dishesProvider, child) {
            return Column(
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
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: const [
                          FirstHomeScreenContainer(),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      dishesProvider.favoriteDishList != null ||
                              loggedInUser != null
                          ? const Text(
                              'Favorite Dishes:',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            )
                          : const Text(''),
                      dishesProvider.viewedDishList == null ||
                              loggedInUser == null
                          ? const SecondHomeScreenContainer()
                          : SizedBox(
                              height: 138.2,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    dishesProvider.favoriteDishList?.length,
                                itemBuilder: (context, index) {
                                  final Map item =
                                      dishesProvider.favoriteDishList![index];
                                  return GestureDetector(
                                    child: FavoriteDishes(
                                      image: item['dishImage'],
                                      dishName: item['dishName'],
                                      region: item['dishRegion'],
                                      dateAdded: 'Yesterday 3pm',
                                      price: item['dishprice'],
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewSingleDish(
                                                    productId: item["id"],
                                                    dishViews:
                                                        item['dishViews'],
                                                    dishImage:
                                                        item['dishImage'],
                                                    dishName: item['dishName'],
                                                    dishDescription:
                                                        item['dishdescription'],
                                                    dishPrice:
                                                        item['dishprice'],
                                                    dishRegion:
                                                        item['dishRegion'],
                                                  )));
                                    },
                                  );
                                },
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
                            Navigator.pushNamed(context, DishlistScreen.id);
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
                      dishesProvider.viewedDishList != null ||
                              loggedInUser != null
                          ? const Text(
                              'Viewed Dishes:',
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.end,
                            )
                          : const Text(''),
                      dishesProvider.viewedDishList == null ||
                              loggedInUser == null
                          ? const SecondHomeScreenContainer()
                          : SizedBox(
                              height: 274.09,
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    dishesProvider.viewedDishList?.length,
                                itemBuilder: (context, index) {
                                  final Map item =
                                      dishesProvider.viewedDishList![index];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 4.99),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewSingleDish(
                                                      productId: item["id"],
                                                      dishViews:
                                                          item['dishViews'],
                                                      dishImage:
                                                          item['dishImage'],
                                                      dishName:
                                                          item['dishName'],
                                                      dishDescription: item[
                                                          'dishdescription'],
                                                      dishPrice:
                                                          item['dishprice'],
                                                      dishRegion:
                                                          item['dishRegion'],
                                                    )));
                                      },
                                      child: Container(
                                        width: 196.92,
                                        decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.grey.shade300,
                                              width: 1.3,
                                              style: BorderStyle.solid),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                              ),
                                              child: CachedNetworkImage(
                                                height: 120.0,
                                                width: 120,
                                                fit: BoxFit.contain,
                                                imageUrl: item['dishImage'],
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              item['dishName'],
                                              style: const TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              item['dishRegion'],
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'poppins',
                                                  color: Color(0xff999999)),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              item['dishprice'],
                                              style: const TextStyle(
                                                  fontFamily: 'poppins',
                                                  fontSize: 18.6278,
                                                  color: appColour),
                                              textAlign: TextAlign.end,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SecondHomeScreenContainer extends StatelessWidget {
  const SecondHomeScreenContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Image(
            image: AssetImage("assets/images/maskgroup.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Suhani Restaurant',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.2972,
                            color: Color(0xff333333),
                          ),
                        ),
                        Text(
                          'Chinnese, North Indian',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.6361,
                            color: Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 57.84,
                      height: 33,
                      decoration: BoxDecoration(
                        color: const Color(0xff509807),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Color(0xffFFFFFF),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '200',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.975,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      '154',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.975,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  child: Text(
                    'Left over food and supplies are gathered and sold for 50% off!',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontStyle: FontStyle.normal,
                        fontSize: 11,
                        color: Color(0xffA7A7A7)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
