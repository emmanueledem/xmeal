// import 'dart:io';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';

// CollectionReference users = FirebaseFirestore.instance.collection('users');
// final auth = FirebaseAuth.instance;

// class ImageScreen extends StatefulWidget {
//   const ImageScreen({Key? key}) : super(key: key);

//   @override
//   State<ImageScreen> createState() => _ImageScreenState();
// }

// class _ImageScreenState extends State<ImageScreen> {
//   File? file;
//   TextEditingController _textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cloud Storage'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//             file == null
//                 ? InkWell(
//                     onTap: () {
//                       chooseImage();
//                     },
//                     child: const Icon(
//                       Icons.image,
//                       size: 48,
//                     ),
//                   )
//                 : Image.file(file!),
//             const SizedBox(height: 40),
//             TextField(
//               controller: _textEditingController,
//               decoration: const InputDecoration(
//                   hintText: "Enter Name",
//                   labelText: "Name",
//                   border: OutlineInputBorder()),
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: updateProfile,
//               child: const Text("Update profile"),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }

//   chooseImage() async {
//     XFile? xfile = await ImagePicker().pickImage(source: ImageSource.camera);

//     file = File(xfile!.path);
//     setState(() {});
//   }

//   updateProfile() async {
//     Map<String, dynamic> map = {};
//     if (file != null) {
//       String url = await uploadImage();
//       map['profileImage'] = url;
//     }

//     map['fullName'] = _textEditingController.text;

//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(auth.currentUser!.uid)
//         .update(map);
//   }

//   Future<String> uploadImage() async {
//     Random random = Random();
//     int randomNumber = random.nextInt(100 * 8000);
//     TaskSnapshot taskSnapshot = await FirebaseStorage.instance
//         .ref()
//         .child("profileImage")
//         .child(FirebaseAuth.instance.currentUser!.uid +
//             randomNumber.toString() +
//             basename(file!.path))
//         .putFile(file!);

//     return taskSnapshot.ref.getDownloadURL();
//   }
// }
