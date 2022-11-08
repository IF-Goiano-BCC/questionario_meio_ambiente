import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';


import 'package:questionario/screens/quiz.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz(name: "Socio economico")
    );
  }
}