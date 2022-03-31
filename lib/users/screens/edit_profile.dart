import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/users/services/providers/user_profile_provider.dart';
import 'package:xmeal/users/styles/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const id = 'editProfileScreen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? file;
  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: profileProvider.saving,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: appColour,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_outlined),
                            color: Colors.white,
                            iconSize: 25,
                          ),
                          const Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'poppins'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'SAVE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: ClipOval(
                                child: profileProvider.imageUrl == null
                                    ? Image.asset(
                                        'assets/images/userAvater.png',
                                        fit: BoxFit.cover,
                                        width: 95.95,
                                        height: 95.95,
                                      )
                                    : Image.network(
                                        profileProvider.imageUrl.toString(),
                                        fit: BoxFit.cover,
                                        width: 95.95,
                                        height: 95.95,
                                      )),
                          ),
                          Positioned(
                            left: 225.0,
                            top: 55.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: IconButton(
                                  onPressed: () {
                                    openPhotoStyle();
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  chooseImage(value) async {
    Navigator.pop(context);
    XFile? xfile = await ImagePicker().pickImage(source: value);

    file = File(xfile!.path);
    setState(() {
      displayImageSel();
    });
  }

  Future<void> openPhotoStyle() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text("Select a method"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  chooseImage(ImageSource.camera);
                },
                child: const Text(
                  "Take a photo",
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SimpleDialogOption(
                onPressed: () {
                  chooseImage(ImageSource.gallery);
                },
                child: const Text(
                  "Choose From Gallery",
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              )
            ],
          );
        })) {
    }
  }

  Future<void> displayImageSel() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: [
              const SizedBox(
                height: 10,
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: Image.file(file!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      file = null;
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var profileProvider =
                          Provider.of<ProfileProvider>(context, listen: false);
                      profileProvider.updateProfileImage(file);
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  )
                ],
              )
            ],
          );
        })) {
    }
  }
}
