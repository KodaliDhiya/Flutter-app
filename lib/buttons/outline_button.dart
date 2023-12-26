import 'package:flutter/material.dart';
 
class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({super.key});
 
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          print("User logged in successfully");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("Awesome Snackbar"),
            action: SnackBarAction(label: 'action',onPressed: () {
              //code to execute
            },),
          ));
        },
        child: const Icon(Icons.lock));
  }
}
 