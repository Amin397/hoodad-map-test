import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskModel{


  int id;
  String title;
  RxBool isSelected;
  Alignment alignment;

  TaskModel({required this.id, required this.title, required this.isSelected , required this.alignment});
}