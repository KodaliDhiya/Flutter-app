import 'package:flutter/material.dart';

class FlexDirections extends StatelessWidget {
  const FlexDirections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [Text("Hello world1")],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Text(
                    "Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2Hello world2")
              ],
            ),
          )
        ],
      ),
    );
  }
}