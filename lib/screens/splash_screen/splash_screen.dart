import 'package:flutter/material.dart';

class MySpahScreen extends StatelessWidget {
  const MySpahScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF84C1FA).withOpacity(1.0),
      body: Center(
          child: Card(
        shadowColor: Colors.grey[900],
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(110)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(110),
          child: Image.asset(
            'assets/images/34..03.jpg',
            width: MediaQuery.of(context).size.width * .7,
          ),
        ),
      )),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}
