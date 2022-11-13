import 'package:flutter/material.dart';
import '../../components/question.dart';

import 'package:questionario/constants/MapaUrbanistico.dart';
import 'package:questionario/constants/styles.dart';



class MapaUrb extends StatefulWidget {
  final Function callback;
  final String pre;
  const MapaUrb({Key? key, required this.pre, required this.callback}) : super(key: key);

  @override
  State<MapaUrb> createState() => _MapaUrbState();
}




class _MapaUrbState extends State<MapaUrb> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("MAPA URBANÍSTICO", style: sectionTitleStyle),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          shrinkWrap: true,
          itemCount:  questions.length,
          itemBuilder: (context, index){
          return Question(
          id: questions[index]["id"], 
          name: questions[index]["name"],
          options: questions[index]["options"],
          onUpdate: _save);
        })
      ],
    );
  }

  _save(String key, dynamic value){
    widget.callback(widget.pre + key, value);
  }
}