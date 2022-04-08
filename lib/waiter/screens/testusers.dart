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
  final TextEditingController _searchContoller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchContoller.addListener(_onSearchedChanged);
  }

  _onSearchedChanged() {
    print(_searchContoller.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchContoller.removeListener(_onSearchedChanged);
    _searchContoller.dispose();
    super.dispose();
  }

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
                  controller: _searchContoller,
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: _fireStore
                      .collection("users")
                      .where('userType', isEqualTo: 'user')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return UsersInformation(
                            image: data['profileImage'],
                            email: data['email'],
                            name: data['fullName']);
                      }).toList(),
                    );
                  },
                ),
              ),
            )
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
