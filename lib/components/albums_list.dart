import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/user_models.dart';
import 'package:http/http.dart' as http;

class AlbumListScreen extends StatefulWidget {
  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  List<Albums>? albums;

  @override
  void initState() {
    super.initState();
    fetchAlbums();
  }

  Future<void> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        albums = jsonList.map((json) => Albums.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: albums != null
          ? ListView.builder(
              itemCount: albums?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(albums![index].title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PhotoListScreen(album: albums![index]),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class PhotoListScreen extends StatefulWidget {
  final Albums album;

  PhotoListScreen({required this.album});

  @override
  _PhotoListScreenState createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  List<Photos>? photos;

  @override
  void initState() {
    fetchPhotos();
    super.initState();
  }

  Future<void> fetchPhotos() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=${widget.album.id}'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        photos = jsonList.map((json) => Photos.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos in ${widget.album.title}'),
      ),
      body: photos != null
          ? ListView.builder(
              itemCount: photos?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .start, // Aligns children to the center vertically
                    crossAxisAlignment: CrossAxisAlignment
                        .center, // Aligns children to the center horizontally
                    children: [
                      Image.network(
                        photos![index].thumbnailUrl,
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        // width: 100,
                        // color: Colors.blue,
                        child: Text(
                        photos![index].title,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ),
                      // ListTile(title: Text(photos![index].title)),
                    ],
                  ),
                );
                // return Card(
                //   child: ListTile(
                //     title: Text(photos![index].title),
                //   ),
                // );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
