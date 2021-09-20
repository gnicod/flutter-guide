import 'dart:convert';

import 'point.dart';

//the created user class
class GuidedRoute {

  String ?name;
  List<Point> ?points;
  String ?description; //location

  //class constructor
  GuidedRoute({
    this.name, //username
    this.points, //profile picture
    this.description, //location
  });

  //JSON serialization: return the value from json
  factory GuidedRoute.fromRawJson(String str) => GuidedRoute.fromJson(json.decode(str));

  //encode data to json format
  String toRawJson() => json.encode(toJson());

  //creating a dart user object from the json object
  factory GuidedRoute.fromJson(Map<String, dynamic> json) => GuidedRoute(
    name: json["name"],
    description: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}

