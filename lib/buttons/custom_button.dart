import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const CustomButtonWidget(
      {super.key,
      required this.buttonName,
      required this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
     child: Text(buttonName),
     );
  }
}
