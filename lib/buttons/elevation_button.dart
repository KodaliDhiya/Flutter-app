import 'package:flutter/material.dart';
 
class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print("User logged in successfully");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Awesome Snackbar"),
            action: SnackBarAction(label: 'action',onPressed: () {
              //code to execute
            },),
          ));
        },
        child: Text("Submit"));
  }
}
 