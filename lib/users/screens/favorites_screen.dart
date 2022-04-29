import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/dishes_provider.dart';
import 'package:xmeal/users/screens/login_screen.dart';
import 'package:xmeal/users/screens/view_single_dish.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/empty_list_error.dart';
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

class FavoriteScreenContent extends StatefulWidget {
  const FavoriteScreenContent({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteScreenContent> createState() => _FavoriteScreenContentState();
}

class _FavoriteScreenContentState extends State<FavoriteScreenContent> {
  @override
  void initState() {
    super.initState();
    _handleFavoriteDishes();
  }

  Future _handleFavoriteDishes() async {
    await Provider.of<DishesProvider>(context, listen: false)
        .fetchFavoriteDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Consumer<DishesProvider>(
          builder: (context, favoriteDish, child) {
            return Column(children: [
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
              favoriteDish.favoriteDishList != null
                  ? Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: favoriteDish.favoriteDishList?.length,
                          itemBuilder: (_, index) {
                            final Map item =
                                favoriteDish.favoriteDishList![index];
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 17, top: 8.0),
                                child: FavoriteDishes(
                                  image: item['dishImage'],
                                  dishName: item['dishName'],
                                  region: item['dishRegion'],
                                  dateAdded: 'Yesterday 3pm',
                                  price: item['dishprice'],
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewSingleDish(
                                          productId: item["id"],
                                          dishViews: item['dishViews'],
                                          dishImage: item['dishImage'],
                                          dishName: item['dishName'],
                                          dishDescription:
                                              item['dishdescription'],
                                          dishPrice: item['dishprice'],
                                          dishRegion: item['dishRegion'],
                                        )));
                              },
                            );
                          },
                        ),
                      ),
                    )
                  : favoriteDish.hasFavorite == false
                      ? const Center(child: CircularProgressIndicator())
                      : EmptyListError(
                          errorText:
                              'When you have favorite dishe\'s they will appear here.'),
            ]);
          },
        ),
      ),
    );
  }
}
