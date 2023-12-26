import 'package:flutter/material.dart';
 
class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
 