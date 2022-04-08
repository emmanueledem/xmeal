import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xmeal/users/styles/constants.dart';

class AllUsersList extends StatefulWidget {
  AllUsersList({Key? key}) : super(key: key);
  static const id = 'AllUsersList';

  @override
  State<AllUsersList> createState() => _AllUsersListState();
}

class _AllUsersListState extends State<AllUsersList> {
  final _fireStore = FirebaseFirestore.instance;

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
    getUserData();

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List _allResults = [];

  Future getUserData() async {
    var data = await _fireStore
        .collection("users")
        .where('userType', isEqualTo: 'user')
        .get();
    setState(() {
      _allResults = data.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userList = _searchText.isEmpty
        ? _allResults
        : _allResults
            .where(
              (item) =>
                  item['fullName'].contains(_searchText) ||
                  item['email'].contains(_searchText),
            )
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
                    hintText: 'Search a User',
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
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final item = userList[index];
                        return UsersInformation(
                          image: item['profileImage'],
                          email: item['email'],
                          name: item['fullName'],
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersInformation extends StatelessWidget {
  UsersInformation({Key? key, required this.image, this.email, this.name})
      : super(key: key);
  String? image;
  String? name;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    : Image(image: NetworkImage(image.toString()))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name.toString(),
                    style: const TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                  Text(
                    email.toString(),
                    style: const TextStyle(
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
    );
  }
}
