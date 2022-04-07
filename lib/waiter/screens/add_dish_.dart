import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:xmeal/services/providers/dishes_provider.dart';
import 'package:xmeal/services/providers/internet_provider.dart';
import 'package:xmeal/users/styles/constants.dart';

import '../../users/widgets/network_alert.dart';

class WaiterAddDishScreen extends StatefulWidget {
  const WaiterAddDishScreen({Key? key}) : super(key: key);
  static const id = 'WaiterAddDishScreen';

  @override
  State<WaiterAddDishScreen> createState() => _WaiterAddDishScreenState();
}

class _WaiterAddDishScreenState extends State<WaiterAddDishScreen> {
  File? file;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dishName = TextEditingController();
  final TextEditingController _dishRegion = TextEditingController();
  final TextEditingController _dishPrice = TextEditingController();
  final TextEditingController _dishDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appColour,
        centerTitle: true,
        title: const Text(
          'Add Dishes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<DishesProvider>(
        builder: (context, dishprovider, child) {
          return ModalProgressHUD(
            inAsyncCall: dishprovider.saving,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          openPhotoStyle();
                        },
                        child: const Icon(
                          Icons.photo_camera,
                          size: 48,
                        ),
                      ),
                      file != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.file(file!)),
                            )
                          : const SizedBox(height: 40),
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
                                    controller: _dishName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontFamily: 'poppins',
                                        height: 1.3),
                                    decoration: kEditProfileInputDecorationStyle
                                        .copyWith(
                                      labelText: 'Dish Name',
                                    ),
                                    validator: (String? value) {
                                      return (value == null || value.isEmpty)
                                          ? 'Dish Name is required'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  TextFormField(
                                    controller: _dishRegion,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontFamily: 'poppins',
                                        height: 1.3),
                                    decoration: kEditProfileInputDecorationStyle
                                        .copyWith(
                                      labelText: 'Dish Region',
                                    ),
                                    validator: (String? value) {
                                      return (value == null || value.isEmpty)
                                          ? 'Dish Region is required'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  TextFormField(
                                    controller: _dishPrice,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontFamily: 'poppins',
                                        height: 1.3),
                                    decoration: kEditProfileInputDecorationStyle
                                        .copyWith(
                                      labelText: 'Dish Price',
                                    ),
                                    validator: (String? value) {
                                      return (value == null || value.isEmpty)
                                          ? 'Dish Prce is required'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  TextFormField(
                                    controller: _dishDescription,
                                    maxLines: 5,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        fontFamily: 'poppins',
                                        height: 1.3),
                                    decoration: kEditProfileInputDecorationStyle
                                        .copyWith(
                                      labelText: 'Dish Description',
                                    ),
                                    validator: (String? value) {
                                      return (value == null || value.isEmpty)
                                          ? 'Description is required'
                                          : null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: MaterialButton(
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            var networkProvider =
                                                Provider.of<NetworkInfoImpl>(
                                                    context,
                                                    listen: false);
                                            await networkProvider
                                                .checkNewtworkStatus();
                                            if (networkProvider.networkStatus ==
                                                true) {
                                              var dishProvider =
                                                  Provider.of<DishesProvider>(
                                                      context,
                                                      listen: false);
                                              await dishProvider.createDish(
                                                _dishName.text.trim(),
                                                _dishRegion.text.trim(),
                                                _dishPrice.text.trim(),
                                                _dishDescription.text.trim(),
                                                file,
                                              );
                                              _dishName.clear();
                                              _dishRegion.clear();
                                              _dishPrice.clear();
                                              _dishDescription.clear();
                                              file = null;
                                              setState(() {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              });
                                              var snackBar = SnackBar(
                                                backgroundColor: appColour,
                                                duration:
                                                    const Duration(seconds: 5),
                                                content: Text(
                                                  dishprovider.updateResponse
                                                      .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              );
                                              Scaffold.of(context)
                                                  // ignore: deprecated_member_use
                                                  .showSnackBar(snackBar);
                                            } else {
                                              networkAlertMessage(context);
                                            }
                                          }
                                        },
                                        minWidth: 365,
                                        height: 51,
                                        textColor: Colors.white,
                                        color: appColour,
                                        child: const Text(
                                          'Submit',
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
                                  ),
                                ],
                              )),
                        ),
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }

  chooseImage(value) async {
    Navigator.pop(context);
    XFile? xfile = await ImagePicker().pickImage(source: value);

    file = File(xfile!.path);
    setState(() {});
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
}
