import 'dart:io';
import 'package:flutter/material.dart';
import "package:image_picker/image_picker.dart";

class TheBody extends StatefulWidget {
  @override
  _TheBodyState createState() => _TheBodyState();
}

class _TheBodyState extends State<TheBody> {
  File _image;

  Future getImage() async {
    Navigator.pop(context);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openGallery() async {
    Navigator.pop(context);
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: _image == null ? Text("Pick a Image") : Image.file(_image),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.photo_camera),
        onPressed: _openDialogBox,
      ),
    );
  }

  _openDialogBox() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //shape: CircleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Take a Pic From Camera"),
                    onTap: getImage,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    child: Text("Picture From Gallery"),
                    onTap: openGallery,
                  )
                ],
              ),
            ),
          );
        });
  }
}
