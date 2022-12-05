import 'package:flutter/material.dart';
import '../../components/question.dart';

import 'package:MapUrb/constants/Infraestrutura.dart';
import 'package:MapUrb/constants/styles.dart';



class Infra extends StatefulWidget {
  final Function callback;
  final String pre;
  const Infra({Key? key, required this.pre, required this.callback}) : super(key: key);

  @override
  State<Infra> createState() => _InfraState();
}




class _InfraState extends State<Infra> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Infraestrutura", style: sectionTitleStyle),
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