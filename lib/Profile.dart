import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower/shared/Colors.dart';
import 'package:flower/shared/DataFromFirestore.dart';
import 'package:flower/shared/DisplayEmail.dart';
import 'package:flower/shared/displayname.dart';
import 'package:flower/shared/user_img_from_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final credential = FirebaseAuth.instance.currentUser;
    //final userinfo = FirebaseAuth.instance.currentUser!;
    File? imgPath;

    uploadImage() async {
      final pickedImg =
          await ImagePicker().pickImage(source: ImageSource.camera);
      try {
        if (pickedImg != null) {
          setState(() {
            imgPath = File(pickedImg.path);
          });
        } else {
          print("NO img selected");
        }
      } catch (e) {
        print("Error => $e");
      }
    }

    return Scaffold(
      //MediaQuery.of(context).size.width > 600 ? secondaryColor2 : Colors.white,

      appBar: MediaQuery.of(context).size.width > 600
          ? null
          : AppBar(
              actions: [
                TextButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    if (!mounted) return;
                    Navigator.pop(context);
                  },
                  label: const Text(
                    "logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                )
              ],
              backgroundColor: appbarGreen,
              title: const Text("Profile Screen"),
            ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(
            vertical: 11,
            horizontal: MediaQuery.of(context).size.width > 600
                ? MediaQuery.of(context).size.width / 6
                : 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(125, 78, 91, 110),
                          ),
                          child: Stack(
                            children: [
                              imgPath == null
                                  ? const ImgUser()
                                  : ClipOval(
                                      child: Image.file(
                                        imgPath!,
                                        width: 145,
                                        height: 145,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              Positioned(
                                left: 95,
                                bottom: -10,
                                child: IconButton(
                                  onPressed: () {
                                    uploadImage();
                                  },
                                  icon: const Icon(Icons.add_a_photo),
                                  color:
                                      const Color.fromARGB(255, 94, 115, 128),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const DisplayName(),
                  ],
                ),
              ),
              const SizedBox(height: 22,),

              Row(children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 10,
                      )),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                ),
                child: Center(
                  child: Text(
                    'Personal Info',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              GetDataFromFirestore(
                documentId: credential!.uid,
              ),
              const Divider(
                color: Colors.black,
                height: 0.33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
