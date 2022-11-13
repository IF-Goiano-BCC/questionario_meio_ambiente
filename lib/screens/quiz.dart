// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

import 'formSteps/Ident.dart';
import 'formSteps/Infra.dart';
import 'formSteps/Mapa.dart';
import "../data/managet.dart";


class Quiz extends StatefulWidget{
  final String name;
  const Quiz({Key? key, required this.name}): super(key:key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizState createState() => _QuizState();

}

class _QuizState extends State<Quiz>{
  final _formKey = GlobalKey<FormState>();
  final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  var data = <String, dynamic>{};
  var isLoading = false;

  _att_values(String key, dynamic value){
    setState(() {
      data[key] = value;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
          title: Text(widget.name),
        ) ,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(widget.name),
              MapaUrb(pre: "map_", callback:_att_values),
              Identificacao(pre: "ident_", callback:_att_values),
              Infra(pre: "inf_", callback:_att_values),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                children: [
                  ElevatedButton(
                  style: style,
                  onPressed: isLoading? null:_Saveform,
                  child: isLoading ? const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  )
                  :const Text('Salvar'),
                ),
                ],
              )
              ],
          ),
        )
      ),
    );
  }
  // ignore: non_constant_identifier_names
  _Saveform()async{
      setState((){
        isLoading = true;
      });
      Geolocator.requestPermission();
      Position position = await _determinePosition();

      Map<String, dynamic> newRegistry = {
        "posLat": position.latitude,
        "posLon": position.longitude,
        "time": DateTime.now().toString(),
      };
      data.forEach((k, v) => newRegistry[k] = v);
      await updateLocaldata(newRegistry);
      setState(() {
        data.clear();
        isLoading = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NewQuiz()));
      
  }

}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}


class NewQuiz extends StatelessWidget {
  const NewQuiz({Key? key}) : super(key: key);
  static ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text("socio"),
        ) ,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                children: [
                  ElevatedButton(
                  style: style,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Quiz(name: "Socio economico")));
                  },
                  child: const Text('Novo Questionario'),
                ),
                ],
              )
              ],
          ),
        )
      ),
    );
  }
}