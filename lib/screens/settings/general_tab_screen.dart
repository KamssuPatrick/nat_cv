import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/common/ui/non_overscroll_widget.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';

import 'package:nat_cv/screens/settings/widget/text_input_widget.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widget/button_widget.dart';

class GeneralTab extends TabInterface {
  GeneralTab(String titleName) : super(titleName);

  @override
  _GeneralTabState createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> with AutomaticKeepAliveClientMixin {

    String? photoProfil = "";

   File? imageFile = null;
   String imageUrl = "";
   bool? isLoading;


   Future getImage() async {
     ImagePicker imagePicker = ImagePicker();
     PickedFile pickedFile;

     pickedFile = (await imagePicker.getImage(source: ImageSource.gallery))!;
     imageFile = File(pickedFile.path);

     if (imageFile != null) {
       setState(() {
         isLoading = true;
       });
       // uploadFile();
     }
   }
   

   // Widget buildLoading() {
   //   return Positioned(
   //     child: isLoading ? Loading() : Container(),
   //   );
   // }

   // Future uploadFile() async {
   //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
   //   StorageReference reference =
   //   FirebaseStorage.instance.ref().child("imageProfil").child(fileName);
   //   StorageUploadTask uploadTask = reference.putFile(imageFile);
   //   StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
   //   storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
   //     imageUrl = downloadUrl;
   //     setState(() {
   //       isLoading = false;
   //       // onSendMessage(imageUrl, 1);
   //       _putData.photoProfilChange(useruid, imageUrl);
   //     });
   //   }, onError: (err) {
   //     setState(() {
   //       isLoading = false;
   //     });
   //     Fluttertoast.showToast(msg: 'This file is not an image');
   //   });
   // }

  @override
  bool get wantKeepAlive => true;

  final deviceNameTextController = TextEditingController();



  final deviceNameKey = GlobalKey<TextInputState>();

  // bool get wantKeepAlive => true;

  final serverTextController = TextEditingController();

  final portTextController = TextEditingController();

  final usernameTextController = TextEditingController();

  final pathTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final serverKey = GlobalKey<TextInputState>();

  final portKey = GlobalKey<TextInputState>();

  final usernameKey = GlobalKey<TextInputState>();

  final pathKey = GlobalKey<TextInputState>();

  final passwordKey = GlobalKey<TextInputState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Stack(
        children: <Widget>[
          NonOverscrollWidget(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {

                      },
                      child: Neumorphic(
                        // boxShape:  NeumorphicBoxShape.circle(),
                        // curve: ,
                        padding: EdgeInsets.all(10),
                        style: NeumorphicStyle(
                          depth: NeumorphicTheme.embossDepth(context),
                        ),
                        child: photoProfil == null ? Icon(
                          Icons.insert_emoticon,
                          size: 120,
                          color: Colors.black.withOpacity(0.2),
                        ) : CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                          NetworkImage("$photoProfil"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  TextInput(
                    key: serverKey,
                    controller: serverTextController,
                    labelText: 'Email',
                    hintText: 'Votre email', textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  TextInput(
                    key: portKey,
                    controller: portTextController,
                    labelText: 'Nom et prenom',
                    hintText: 'Entrez votre nom et votre prenom ',
                    textInputType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  TextInput(
                    key: usernameKey,
                    controller: usernameTextController,
                    labelText: 'Téléphone',
                    hintText: 'Entrez votre numéro de téléphone', textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 24),
                  TextInput(
                    key: passwordKey,
                    controller: passwordTextController,
                    labelText: 'Ville',
                    hintText: "Entrez votre ville de résidence",
                    textInputType: TextInputType.visiblePassword,
                  ),
                  // const SizedBox(height: 24),
                  // TextInput(
                  //   key: pathKey,
                  //   controller: pathTextController,
                  //   labelText: 'Path',
                  //   hintText: 'Enter path', textInputType: TextInputType.text,
                  // ),
                  const SizedBox(height: 140),

                ],
              ),
            ),
          ),
          Button.text(
            labelText: 'Save',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
