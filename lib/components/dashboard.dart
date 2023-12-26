import 'package:flutter/material.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: 1,
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
                        'Dhiya Chowdary',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text('dhiyachowdary@gmail.com'),
                      SizedBox(height: 4.0),
                      Text('Address line 1'),
                      Text('Address line 2'),
                      SizedBox(height: 16.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
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
                            Container(
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
                            Container(
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
    // return Container(
    //   child: Card(
    //     elevation: 5.0,
    //     margin: EdgeInsets.all(16.0),
    //     child: Padding(
    //       padding: EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             'User Details',
    //             style: TextStyle(
    //               fontSize: 18.0,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           SizedBox(height: 8.0),
    //           Text('Name: John Doe'),
    //           Text('Email: john.doe@example.com'),
    //           SizedBox(height: 16.0),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               ElevatedButton(
    //                 onPressed: () {
    //                   // Perform the desired action
    //                   print('Action button pressed');
    //                 },
    //                 child: Text('Action'),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
