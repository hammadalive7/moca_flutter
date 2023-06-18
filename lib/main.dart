import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:moca/views/abstraction_screen.dart';
import 'package:moca/views/cognitive_failure_screen.dart';
// import 'package:moca/views/signup_screen.dart';
// import 'package:moca/views/signup_screen.dart';
// import 'package:moca/views/sociodemographic_sceen.dart';
import 'firebase_options.dart';
// import 'views/orientation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => debugPrint('Firebase initialized in main.dart'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moca',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CognitiveFailure(),
    );
  }
}
