import 'package:catordog_detector/screens/home_screen/bloc/photo_bloc.dart';
import 'package:catordog_detector/screens/home_screen/home_screen.dart';
import 'package:catordog_detector/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MySpahScreen(),
          );
        } else {
          // Loading is done, return the app:
          return BlocProvider(
            create: (context) => PhotoBloc(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Cat and Dog Detector',
              theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: Color(0xFFEEF6FD),
              ),
              home: const HomeScreen(),
            ),
          );
        }
      },
    );
  }
}
