import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/albums_list.dart';
import 'package:flutter_application_1/components/to_dos.dart';
import 'package:flutter_application_1/utils/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email = "";
  List<UserModel> users = [];
  @override
  void initState() {
    getSharedPreferenceData();
    fetchData();
    super.initState();
  }

  getSharedPreferenceData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("email");
    });
  }

  fetchData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      debugPrint("emailGet: $email");
    });
    List<UserModel> usersList = await fetchuserData();
    setState(() {
      users = usersList;
    });
    debugPrint("usersListSize: ${users.length}");
  }

  Future<List<UserModel>> fetchuserData() async {
    List<UserModel> usersList = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      debugPrint('response: $response');
      List<dynamic> jsonData = json.decode(response.body);
      usersList = jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
    return usersList;
  }

  Future<List<UserModel>> fetchUserDetails() async {
    List<UserModel> usersList = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    debugPrint('response==$response');
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      usersList = jsonData.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load users list");
    }
    return usersList;
  }

  Future<List<Comments>> fetchComments(int id) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com//posts/${id}/comments'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Comments.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                elevation: 12,
                shadowColor: Colors.blueAccent,
                surfaceTintColor: Colors.white,
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users[index].name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(users[index].email),
                      SizedBox(height: 4.0),
                      Text(users[index].address.street),
                      Text(users[index].address.city),
                      SizedBox(height: 16.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              // In the Posts section, there should be a collapsible to show the comments associated with a post. Limit the comments to the first 3
                              child: TextButton(
                                onPressed: () {
                                  // Show the bottom sheet when the button is pressed
                                  showModalBottomSheet(
                                    context: context,
                                    barrierLabel: "Comments",
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      // This is the content of the bottom sheet
                                      return Container(
                                        height: MediaQuery.of(context).size.height * 0.3,
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Comments",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            FutureBuilder<List<Comments>>(
                                              future: fetchComments(
                                                  users[index].id),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                } else if (snapshot.hasError) {
                                                  return Center(
                                                      child: Text(
                                                          'Error: ${snapshot.error}'));
                                                } else if (!snapshot.hasData ||
                                                    snapshot.data!.isEmpty) {
                                                  return Center(
                                                      child: Text(
                                                          'No comments available.'));
                                                } else {
                                                  // Display the first 3 comments
                                                  final List<Comments>
                                                      comments = snapshot.data!
                                                          .take(3)
                                                          .toList();

                                                  return Expanded(
                                                    child: ListView.builder(
                                                      itemCount:
                                                          comments.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          title: Text(
                                                              '${index+1}, ${comments[index].name}'),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.chat,
                                      size: 20.0,
                                      color: Colors.blueAccent,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text("Posts"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  // Show the bottom sheet when the button is pressed
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // This is the content of the bottom sheet
                                      return AlbumListScreen();
                                      // return Container(
                                      //   padding: EdgeInsets.all(16.0),
                                      //   child: Text(
                                      //     'This is a button sheet!',
                                      //     style: TextStyle(fontSize: 18.0),
                                      //   ),
                                      // );
                                    },
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.photo,
                                      size: 20.0,
                                      color: Colors.blueAccent,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text("Albums"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  // Show the bottom sheet when the button is pressed
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      // This is the content of the bottom sheet
                                      return TodoListScreen();
                                      // return Container(
                                      //   padding: EdgeInsets.all(16.0),
                                      //   child: Text(
                                      //     'This is a button sheet!',
                                      //     style: TextStyle(fontSize: 18.0),
                                      //   ),
                                      // );
                                    },
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.post_add,
                                      size: 20.0,
                                      color: Colors.blueAccent,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Text("To-dos"),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
