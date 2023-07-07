import 'package:flutter/material.dart';

class NewsfeedModel {
  String? postedBy;
  DateTime? postedDate;
  String? text;
  Image? image;
  NewsfeedModel({this.postedBy, this.postedDate, this.text, this.image});

  NewsfeedModel.fromMap(Map<String, dynamic> map) {
    postedBy = map["postedBy"];
    postedDate = map["postedDate"];
    text = map["text"];
    image = map["image"];
  }

  Map<String, dynamic> toMap() {
    return {
      "postedBy": postedBy,
      "postedDate": postedDate,
      "text": text,
      "image": image,
    };
  }
}
