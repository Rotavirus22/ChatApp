import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  hintText: 'Enter an email',
);
const searchDecoration = InputDecoration(
  prefixIcon: Icon(Icons.search),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: Colors.blueAccent,width: 32.0),
  ),
  focusedBorder: OutlineInputBorder(
     borderSide: BorderSide(color: Colors.white, width: 32.0),
  ),
  hintText: 'Search',
);
