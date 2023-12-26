import 'package:flutter/material.dart';
 
class ContactCardScreen extends StatelessWidget {
  final String name;
  final String profilePicture;
  final String designation;
  const ContactCardScreen(
      {super.key,
      required this.name,
      required this.profilePicture,
      required this.designation});
 
@override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 308,
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                   CircleAvatar(
                    backgroundImage: NetworkImage(
                       profilePicture),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name),
                          Text("2 mins ago"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                "https://images.edrawsoft.com/articles/how-to-design-book-cover/how-to-design-book-cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Row(
                      children: [
                        Icon(Icons.thumb_up),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Like"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: const Row(
                      children: [
                        Icon(Icons.comment),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Comment"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: const Row(
                      children: [
                        Icon(Icons.share),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Share"),
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
    );
  }
}