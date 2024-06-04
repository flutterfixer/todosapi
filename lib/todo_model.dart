// import 'dart:ffi';

class TodoModel{

  // here completed data type was bool you took string that was causing error solved 
  bool? completed;
  int? id;
  String? todo;
  int? userId;


  TodoModel({required this.id , required this.completed , required this.todo, required this.userId});

  // map to model
 factory TodoModel.fromJson(Map<String,dynamic> json){
   return TodoModel(
       id: json['id'],
       completed:json['completed'],
       todo: json['todo'],
       userId: json['userId'],
   );
   }


 }