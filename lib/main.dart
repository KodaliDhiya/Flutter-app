import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/buttons/custom_button.dart';
import 'package:flutter_application_1/buttons/elevation_button.dart';
import 'package:flutter_application_1/buttons/outline_button.dart';
import 'package:flutter_application_1/buttons/switch_button.dart';
import 'package:flutter_application_1/buttons/text_button.dart';
import 'package:flutter_application_1/components/home_page.dart';
import 'package:flutter_application_1/components/dashboard.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/utils/text_field.dart';
import 'package:flutter_application_1/utils/text_form_field.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';
import 'package:flutter_application_1/widgets/flex_widget.dart';
import 'package:flutter_application_1/widgets/image_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
  //   SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  // }
  runApp(MyApp());
}

class ExpandableWithFlex extends StatelessWidget {
  const ExpandableWithFlex({super.key});

  @override
  Widget build(BuildContext context) {
    //about media query start
    var width, size, height, orientation;
    size = MediaQuery.of(context).size;
    orientation = MediaQuery.of(context).orientation;
    width = size.width;
    height = size.height;
    // return orientation == Orientation.portrait
    //     ? Container(color: Colors.amber, width: width / 2)
    //     : Container(color: Colors.blue, width: width / 5);
    //about media query end

    //render something based on platform
    // return kIsWeb
    //     ? const Text("web")
    //     : Platform.isIOS
    //         ? const Text('iOS')
    //         : const Text("Other");
    //render something based on platform end

    //creating widget with in another widget using LayoutBuilder
    return Container(
      height: height * 0.5,
      width: width,
      alignment: Alignment.center,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: constraints.maxHeight * 0.5,
          width: constraints.maxWidth * 0.5,
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text("Hello World"),
        );
      }),
    );
    //creating widget with in another widget using LayoutBuilder end
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Training',
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/loginScreen': (BuildContext context) => const MyLoginWidget(),
        '/home': (BuildContext context) => const HomePage(),
        '/users': (BuildContext context) => const UserListWidget()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    String? email = "";
  @override
    void initState() {
    getSharedPreferenceData();
    super.initState();
  }
  getSharedPreferenceData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("email");
      Timer(
          const Duration(seconds: 3),
          () => (email == null)
              ? Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => MyLoginWidget()))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage())));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Image.network(
              "https://www.pngitem.com/pimgs/m/115-1152235_r-letter-png-hd-image-r-logo-design.png",
            ),
      ), 
    ); 
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 64, 242, 255))),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Flutter App"),
            centerTitle: true,
            elevation: 0,
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () => debugPrint("true"),
              child: const Icon(Icons.add)),
          backgroundColor: Colors.grey[100],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ExpandableWithFlex(),
                // FlexDirections(),
                // StackWidget(),
                // CardWidget(),
                // TextButtonWidget(),
                // ElevatedButtonWidget(),
                // OutlinedButtonWidget(),
                // SwitchButtonWidget(),
                Text(
                  "Welcome to my application",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomButtonWidget(
                  buttonName: 'Login',
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginWidget()));
                    Navigator.of(context).pushNamed('/loginScreen', arguments: {
                      "username": "Ramya",
                      "password": "12345678"
                    });
                  },
                )
                // ContactCardScreen(
                //     name: 'Ramya',
                //     profilePicture:
                //         'https://i0.wp.com/maistorybook.com/wp-content/uploads/2020/07/IMG_5186.jpg',
                //     designation: 'Trainer',
                //   ),
                //   TextFieldWidget(),
                // Padding(
                //   padding:
                //       EdgeInsets.all(16.0),
                //   child: TextFormFieldWidget(hintText: 'Enter username'),
                // ),
                // Padding(
                //   padding:
                //       EdgeInsets.all(16.0),
                //   child: TextFormFieldWidget(hintText: 'Enter password'),
                // ),
                // Padding(
                //   padding:
                //       EdgeInsets.all(16.0), // You can adjust the values as needed
                //   child: ElevatedButtonWidget(),
                // ),
              ],
            ),
          )),
    );
  }
}
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       appBarTheme: const AppBarTheme(backgroundColor: Colors.greenAccent)
    //     ),
    //     home: Scaffold(
    //       appBar: AppBar(title: const Text("Test")),
    //       floatingActionButton: FloatingActionButton(onPressed:() => debugPrint("clicked"),
    //       child: const Icon(Icons.add)),
    //       body: Center (
    //       child: Container(
    //         height: 100,
    //         width: 100,
    //         decoration: BoxDecoration(color: Colors.amberAccent, borderRadius: BorderRadius.circular(10)),
    //         child: const Text("Ramya", style: (TextStyle(color: Colors.white)),),
    //       )
    //     )
    //     ),
    //   );
    // }
