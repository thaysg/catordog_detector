import 'dart:io';
import 'package:catordog_detector/screens/home_screen/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'bloc/photo_bloc.dart';

enum UserChoice {
  gallery,
  camera,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserChoice? selectedChoice;

  File? _image;
  List? _output;
  final picker = ImagePicker();

  @override
  void initState() {
    // final setImage = context.read<PhotoBloc>().state as PhotoInitial;
    super.initState();

    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);
    setState(() {
      _output = output;
      //_loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future cameraOrGallery(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else
        print('No photo was selected or taken');
    });
    detectImage(_image!);
  }

  /* pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image!);
  } */

  /* pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image!);
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEF6FD),
        title: Text(
          'Cat and Dog Detector',
          key: Key(
            'CatDogDetector',
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/cat.png',
                  key: Key('CatImage'),
                  width: MediaQuery.of(context).size.width * .30,
                ),
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/images/dog.png',
                  key: Key('DogImage'),
                  width: MediaQuery.of(context).size.width * .30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              _image != null
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.grey.shade900,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ).image,
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              _output != null
                  ? Text(
                      '${_output![0]['label']}',
                      key: Key('OutputTest'),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocProvider(
                create: (context) => PhotoBloc(),
                child: ButtonWidget(
                  onTap: () {
                    selectedChoice = UserChoice.camera;
                    print(UserChoice.camera);
                    //pickImage();
                    cameraOrGallery(ImageSource.camera);
                    /* setState(() {
                      selectedChoice = UserChoice.camera;
                      print(UserChoice.camera);
                      //pickImage();
                      cameraOrGallery(ImageSource.camera);
                    }); */
                  },
                  color: selectedChoice == UserChoice.camera
                      ? Color(0xFFEEF6FD)
                      : Colors.grey,
                  iconData: Icons.camera,
                  text: 'Camera',
                  key: Key('Camera'),
                  textColor: selectedChoice == UserChoice.camera
                      ? Color(0xFFEEF6FD)
                      : Colors.grey,
                ),
              ),
              BlocProvider(
                create: (context) => PhotoBloc(),
                child: ButtonWidget(
                  onTap: () {
                    selectedChoice = UserChoice.gallery;
                    print(UserChoice.gallery);
                    //pickGalleryImage();
                    cameraOrGallery(ImageSource.gallery);
                    /* setState(() {
                      selectedChoice = UserChoice.gallery;
                      print(UserChoice.gallery);
                      //pickGalleryImage();
                      cameraOrGallery(ImageSource.gallery);
                    }); */
                  },
                  color: selectedChoice == UserChoice.gallery
                      ? Color(0xFFEEF6FD)
                      : Colors.grey,
                  iconData: Icons.image,
                  text: 'Gallery',
                  key: Key('Gallery'),
                  textColor: selectedChoice == UserChoice.gallery
                      ? Color(0xFFEEF6FD)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
