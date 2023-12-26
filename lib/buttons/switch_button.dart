import 'package:flutter/material.dart';
 
class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: true,
        onChanged: ((value) {
          print(value);
        }));
  }
}
 