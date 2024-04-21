import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return[
      ToDo(id:"01", todoText:"Buy groceries", isDone: true),
      ToDo(id:"02", todoText:"Exercises", isDone: true),
      ToDo(id:"03", todoText:"Check Emails",),
      ToDo(id:"04", todoText:"Team Meetings",),
      ToDo(id:"05", todoText:"Work on Mobile Dev for 3 hours",),
    ];
  }
}