
import 'package:flutter/material.dart';

import 'package:MapUrb/constants/MapaUrbanistico.dart';
import 'package:MapUrb/constants/styles.dart';

import '../../components/question.dart';

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
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 4, vertical: 32),
          child: Text("MAPA URBANÍSTICO", style: sectionTitleStyle),
        ),

        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            onChanged: (value) => _save("via", value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Nome da via',
            ),
            ) 
          ),

        Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            onChanged: (value) => _save("bairro", value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Bairro',
            ),
            ) 
          ),

          Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            onChanged: (value) => _save("quadra", value),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Quadra',
            ),
            ) 
          ),
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
          isMulti: questions[index]["isMulti"],
          onUpdate: _save);
        })
      ],
    );
  }

  _save(String key, dynamic value){
    widget.callback(widget.pre + key, value);
  }
}