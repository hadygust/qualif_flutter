import 'package:qualif_flutter/model/comment.dart';

class People{
  String name;
  String image;
  String description;
  List<Comment> comments = [];


  People({required this.name, required this.description, required this.image});
  People.withComment({required this.name, required this.description, required this.image, required this.comments});
}