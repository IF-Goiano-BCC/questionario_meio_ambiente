import 'package:flutter/material.dart';


class StepOne extends StatefulWidget {
  final Function callback;
  final String pre;
  const StepOne({Key? key, required this.pre, required this.callback}) : super(key: key);

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [];
  return menuItems;
}
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      onChanged: (String? newValue){
        setState(() {
          selectedValue = newValue!;
        });
        _save("a", newValue);
      },
      items: dropdownItems
      );
  }

  _save(String key, dynamic value){
    this.widget.callback(this.widget.pre + key, value);
  }
}