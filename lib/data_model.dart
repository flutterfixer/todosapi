



import 'package:todosapi/todo_model.dart';

class DataModel{
int? limit;
int? skip;
List<TodoModel>? todos;
int ? total;


DataModel({required this.total , required this.skip , required this.todos , required this.limit});

// map to model

factory DataModel.fromJson(Map<String,dynamic> json){

  List<TodoModel> mTodos = [];

  for(Map<String, dynamic> eachTodos in json['todos']){

    TodoModel model =TodoModel.fromJson(eachTodos);
    //The newly created TodoModel instance is added to the mTodos list.
    mTodos.add(model);
  }



  return DataModel(
      total: json['total'],
      skip: json['skip'],
      todos: mTodos,
      limit: json['limit'],
  );
}



}