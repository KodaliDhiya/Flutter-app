import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent)),
      home: Scaffold(
        appBar: AppBar(title: const Text("Test")),
        floatingActionButton: FloatingActionButton(
            onPressed: () => debugPrint("clicked"),
            child: const Icon(Icons.add)),
        // body: Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Container(
        //       color: Colors.green,
        //       height: 100,
        //       width: 100,
        //     ),
        //     Image.network(
        //       "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg",
        //       height: 80,
        //       width: 80,
        //     ),
        //     const Text("Ramya"),
        //   ],
        // ),
        body: Container(
          color: Colors.black,
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Aligns children to the center vertically
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Aligns children to the center horizontally
              children: [
                Container(height: 100, width: 100, color: Colors.green),
                SizedBox(
                  width: 20,
                ),
                Container(height: 100, width: 100, color: Colors.green),
                Container(height: 100, width: 100, color: Colors.green),
                Flexible(
                  child: Text(
                    "sdf",
                    maxLines: 2,
                  ),
                )
              ],
            ),
            Text("dfgh"),
            Text("dfgh"),
            Text("dfgh"),
          ]),
        ),
      ),
    );
  }
}
