import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/services/providers/user_profile_provider.dart';
import 'package:xmeal/users/styles/constants.dart';
import 'package:xmeal/users/widgets/network_alert.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);
  static const id = 'editProfileScreen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? newfullName;
  String? newmobileNumber;
  String? newdescription;

  final _formKey = GlobalKey<FormState>();

  File? file;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    newfullName = arguments['name'];
    newmobileNumber = arguments['phoneNummber'];
    newdescription = arguments['description'];
    return Scaffold(
      body: SafeArea(
        child: Consumer<ProfileProvider>(builder: ((context, profile, child) {
          return ModalProgressHUD(
            inAsyncCall: profile.saving,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: appColour,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
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
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var networkProvider =
                                        Provider.of<NetworkInfoImpl>(context,
                                            listen: false);
                                    await networkProvider.checkNewtworkStatus();
                                    if (networkProvider.networkStatus == true) {
                                      await profile.updateUserData(newfullName,
                                          newmobileNumber, newdescription);
                                      var snackBar = SnackBar(
                                          backgroundColor: appColour,
                                          duration: const Duration(seconds: 5),
                                          content: Text(
                                            profile.updateResponse.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ));
                                      Scaffold.of(context)
                                          // ignore: deprecated_member_use
                                          .showSnackBar(snackBar);
                                    } else {
                                      networkAlertMessage(context);
                                    }
                                  }
                                },
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
                            height: 10.0,
                          ),
                          Stack(
                            children: [
                              Center(
                                child: file == null
                                    ? ClipOval(
                                        child: profile.imageUrl == null
                                            ? Image.asset(
                                                defaultImage.toString(),
                                                fit: BoxFit.cover,
                                                width: 95.95,
                                                height: 95.95,
                                              )
                                            : CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                width: 95.95,
                                                height: 95.95,
                                                imageUrl:
                                                    profile.imageUrl.toString(),
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
                                      )
                                    : ClipOval(
                                        child: Image.file(
                                          file!,
                                          fit: BoxFit.cover,
                                          width: 95.95,
                                          height: 95.95,
                                        ),
                                      ),
                              ),
                              Positioned(
                                left: 200.0,
                                top: 55.0,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.blue,
                                  child: IconButton(
                                      onPressed: () {
                                        openPhotoStyle();
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white,
                                        size: 15,
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
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 25.0,
                        right: 25.0,
                      ),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: newfullName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: 'poppins',
                                    height: 1.3),
                                decoration:
                                    kEditProfileInputDecorationStyle.copyWith(
                                  labelText: 'FullName',
                                ),
                                validator: (String? value) {
                                  return (value == null || value.isEmpty)
                                      ? 'FullName is required'
                                      : null;
                                },
                                onChanged: (String? value) {
                                  newfullName = value;
                                },
                              ),
                              const SizedBox(
                                height: 18.0,
                              ),
                              TextFormField(
                                initialValue: newmobileNumber,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: 'poppins',
                                    height: 1.3),
                                decoration:
                                    kEditProfileInputDecorationStyle.copyWith(
                                  labelText: 'Mobile Number',
                                ),
                                validator: (String? value) {
                                  return (value == null || value.isEmpty)
                                      ? 'Mobile Number is required'
                                      : null;
                                },
                                onChanged: (String? value) {
                                  newmobileNumber = value;
                                },
                              ),
                              const SizedBox(
                                height: 18.0,
                              ),
                              TextFormField(
                                initialValue: newdescription,
                                maxLines: 5,
                                maxLength: 50,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontFamily: 'poppins',
                                    height: 1.3),
                                decoration:
                                    kEditProfileInputDecorationStyle.copyWith(
                                  labelText: 'Describe yourSelf',
                                ),
                                validator: (String? value) {
                                  return (value == null || value.isEmpty)
                                      ? 'Description is required'
                                      : null;
                                },
                                onChanged: (String? value) {
                                  newdescription = value;
                                },
                              ),
                              const SizedBox(
                                height: 18.0,
                              ),
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
          );
        })),
      ),
    );
  }

  chooseImage(value) async {
    Navigator.pop(context);
    XFile? xfile = await ImagePicker().pickImage(source: value);

    file = File(xfile!.path);

    displayImageSel();
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
                      setState(() {});
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
                      setState(() {});
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
