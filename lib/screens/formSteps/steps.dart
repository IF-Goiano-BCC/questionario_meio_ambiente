import 'package:flutter/material.dart';
import '../../components/question.dart';
// mapa ubanistico
// identificacao pessoal
// infra da cidade


const List<Map<String, dynamic>> questions = [{
  "id":"Cat_via",
  "name":"CATEGORIA DA VIA URBANA:",
  "isMulti": false,
  "options":["local, 30km/h", "coletora, 40km/h", "arterial, ligam bairros, avenida, 60km/h", "trânsito rápido, 80km/h", "rodovia, 110km/h"],
},
{
  "id":"questio2",
  "name":"CPintpA:",
  "isMulti": false,
  "options":["local, 30km/h", "coletora, 40km/h", "arterial, ligam bairros, avenida, 60km/h", "trânsito rápido, 80km/h", "rodovia, 110km/h"],
}
];

class MapaUbanistico extends StatefulWidget {
  final Function callback;
  final String pre;
  const MapaUbanistico({Key? key, required this.pre, required this.callback}) : super(key: key);

  @override
  State<MapaUbanistico> createState() => _MapaUbanisticoState();
}




class _MapaUbanisticoState extends State<MapaUbanistico> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("MAPA URBANÍSTICO"),
        ListView.builder(
          itemCount:  questions.length,
          itemBuilder: (context, index){
          return Question(
          id: widget.pre + questions[index]["id"], 
          name: questions[index]["name"],
          options: questions[index]["options"],
          onUpdate: widget.callback);
        })
      ],

    );
  }

  _save(String key, dynamic value){
    widget.callback(widget.pre + key, value);
  }
}