
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../signUp_screens.dart';

class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File sampleImage;
  final formKey = new GlobalKey<FormState>();
  String _myValue;
  String url;

  int tester = 0;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      tester = 2;
      print("!!!!!!!!!!!!!!!---------true-------!!!!!!!!!!!!!!");
      return true;
    } else {
      tester = 1;
      print("!!!!!!!!!!!!!!!---------false-------!!!!!!!!!!!!!!");
      return false;
    }
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImage;
    });
  }

  Future uploadStatusImage() async {
    if (validateAndSave()) {
      //save image in firebase
      Reference postImageRef;
      postImageRef = FirebaseStorage.instance.ref().child("Post Images");
      // create  a unique key for each image so that same images should bot be
      // replaced
      var timeKey = new DateTime.now();
      UploadTask uploadTask;
      uploadTask = postImageRef.child(timeKey.toString() + "jpg").putFile(sampleImage);
      // now get the url of image and store in firebase
      var imageUrl;
      imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl.toString();
      print("Image url = " + url);
      saveToDatabase(url);
      goToHomePage();
    }
  }

  void saveToDatabase(url) {


    DatabaseReference ref = FirebaseDatabase.instance.reference();

    var data = {
      "Image": url,
      "Description": _myValue,
    };

    ref.child("Posts").push().set(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Upload Image"),
        ),
        body: Center(
          child: sampleImage == null ? Text("Select an image") : enableUpload(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: "Add Image",
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }

  Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Image.file(
                sampleImage,
                height: 330.0,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                decoration: new InputDecoration(labelText: "Description"),
                validator: (value) {
                  return value.isEmpty ? 'Blog description is required' : null;
                },
                onSaved: (value) {
                  return _myValue = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                elevation: 10.0,
                child: Text("Add a new post"),
                textColor: Colors.white,
                color: Colors.pinkAccent,
                onPressed: uploadStatusImage,
                //   onPressed: goToHomePage,
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

//
// Future uploadStatusImage() async {
//   try {
//     if(validateAndSave()){
//       //save image in firebase
//       Reference postImageRef;
//       try {
//         postImageRef=FirebaseStorage.instance.ref().child("Post Images");
//         print("!!!!!!!!!!!!!!!!Success in Reference!!!!!!!!!!!!!!!!!!");
//       } catch (e) {
//         print("!!!!!!!!!!!!!!!!Failure in Reference!!!!!!!!!!!!!!!!!!");
//         print(e);
//       }
//       // create  a unique key for each image so that same images should bot be
//       // replaced
//
//       var timeKey=new DateTime.now();
//       UploadTask  uploadTask;
//
//       try {
//         uploadTask= postImageRef.child(timeKey.toString()+"jpg").putFile(sampleImage);
//         print("!!!!!!!!!!!!!!!!-------Success in uploadTask------!!!!!!!!!!!!!!!!!!");
//
//       } catch (e) {
//         print("!!!!!!!!!!!!!!!!-------Failure in Reference-----!!!!!!!!!!!!!!!!!!");
//
//         print(e);
//       }
//
//       // now get the url of image and store in firebase
//       var imageUrl;
//       try {
//         imageUrl= await (await uploadTask).ref.getDownloadURL();
//         print("!!!!!!!!!!!!!!!!-------Success in urlDownload--------!!!!!!!!!!!!!!!!!!");
//
//       } catch (e) {
//         print("!!!!!!!!!!!!!!!!-----failure in urlDownload-------!!!!!!!!!!!!!!!!!!");
//         print(e);
//       }
//
//       url=imageUrl.toString();
//       print("Image url = "+url);
//       try {
//         saveToDatabase(url);
//         print("!!!!!!!!!!!!!!!!------success in savetoDatabase-----!!!!!!!!!!!!!!!!!!");
//
//       } catch (e) {
//         print("!!!!!!!!!!!!!!!!---failure in savetoDatabase---!!!!!!!!!!!!!!!!!!");
//
//         print(e);
//       }
//       print("!!!!!!!!!!!!!!!---------true in upload stats img-------!!!!!!!!!!!!!!");
//
//       goToHomePage();
//     }
//   } catch (e) {
//     print("!!!!!!!!!!!!!!!---------false in upload stats img-------!!!!!!!!!!!!!!");
//
//   }
// }
