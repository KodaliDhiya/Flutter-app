// To parse this JSON data, do
//
//     final UserModel = welcomeFromJson(jsonString);

import 'dart:convert';

List<UserModel> UserModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String UserModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    int id;
    String name;
    String username;
    String email;
    Address address;
    String phone;
    String website;
    Company company;

    UserModel({
        required this.id,
        required this.name,
        required this.username,
        required this.email,
        required this.address,
        required this.phone,
        required this.website,
        required this.company,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
    };
}

class Address {
    String street;
    String suite;
    String city;
    String zipcode;
    Geo geo;

    Address({
        required this.street,
        required this.suite,
        required this.city,
        required this.zipcode,
        required this.geo,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
    };
}

class Geo {
    String lat;
    String lng;

    Geo({
        required this.lat,
        required this.lng,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    String name;
    String catchPhrase;
    String bs;

    Company({
        required this.name,
        required this.catchPhrase,
        required this.bs,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}

List<Comments> CommentsFromJson(String str) => List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String CommentsToJson(List<Comments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
    int postId;
    int id;
    String name;
    String email;
    String body;

    Comments({
        required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body,
    });

    factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
    };
}
List<Albums> AlbumsFromJson(String str) => List<Albums>.from(json.decode(str).map((x) => Albums.fromJson(x)));

String AlbumsToJson(List<Albums> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Albums {
    int userId;
    int id;
    String title;

    Albums({
        required this.userId,
        required this.id,
        required this.title,
    });

    factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
    };
}

List<Photos> PhotosFromJson(String str) => List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String PhotosToJson(List<Photos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Photos({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}

List<ToDos> ToDosFromJson(String str) => List<ToDos>.from(json.decode(str).map((x) => ToDos.fromJson(x)));

String ToDosToJson(List<ToDos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDos {
    int userId;
    int id;
    String title;
    bool completed;

    ToDos({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    factory ToDos.fromJson(Map<String, dynamic> json) => ToDos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}