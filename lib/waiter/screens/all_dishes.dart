import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/waiter/screens/view_single_dish.dart';

class WaiterDishlistScreen extends StatefulWidget {
  const WaiterDishlistScreen({Key? key}) : super(key: key);
  static const id = 'Waiter_AllDishes';

  @override
  State<WaiterDishlistScreen> createState() => _WaiterDishlistScreenState();
}

class _WaiterDishlistScreenState extends State<WaiterDishlistScreen> {
  final firestore = FirebaseFirestore.instance;
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    _searchText = _searchController.text.trim();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.trim();
      });
    });

    getDishes();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List allDishes = [];

  Future getDishes() async {
    var data = await firestore.collection('dishes').get();
    setState(() {
      allDishes = data.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dishList = _searchText.isEmpty
        ? allDishes
        : allDishes
            .where((items) =>
                items['dishName'].contains(_searchText) ||
                items['dishprice'].contains(_searchText))
            .toList();
    return Scaffold(
      backgroundColor: appColour,
      body: SafeArea(
        child: Column(
          children: [
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: TextField(
                  controller: _searchController,
                  decoration: kinputdecorationStyle.copyWith(
                    hintText: 'Search a Dish',
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
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dishList.length,
                  itemBuilder: (context, index) {
                    final item = dishList[index];
                    return DishInformation(
                      image: item['dishImage'],
                      dishPrice: item['dishprice'],
                      dishName: item['dishName'],
                      dishRegion: item['dishRegion'],
                      dishdescription: item['dishdescription'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DishInformation extends StatelessWidget {
  DishInformation({
    Key? key,
    required this.image,
    this.dishPrice,
    this.dishName,
    this.dishdescription,
    this.dishRegion,
  }) : super(key: key);
  String? image;
  String? dishName;
  String? dishPrice;
  String? dishdescription;
  String? dishRegion;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WaiterViewSingleDish(
                  dishImage: image,
                  dishName: dishName,
                  dishDescription: dishdescription,
                  dishPrice: dishPrice,
                  dishRegion: dishRegion,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: image == null
                    ? Image(image: AssetImage(defaultImage.toString()))
                    : CachedNetworkImage(
                        imageUrl: image.toString(),
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dishName.toString(),
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      dishPrice.toString(),
                      style: const TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15.6278,
                          color: appColour),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
