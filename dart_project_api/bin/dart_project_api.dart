// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async{
  final todo = await fetch();

  print(todo.title);
  print(todo.id);
  
  //print(json['title']);
}

Future<Todo> fetch() async{
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));

  print(response.body);

  //transformando em json
  var json = jsonDecode(response.body);
/* 
  var todo = Todo(
    title: json['title'],
    id: json['id'],
    userId: json['userId'],   
    completed: json['completed'],
  ); */

  var todo = Todo.fromJson(json);

  return todo;
}

class Todo {

  /*
  "userId": 1,
  "id": 1,
  "title": "delectus aut autem",
  "completed": false
   */

  final String title;
  final int id;
  final int userId;
  final bool completed;

  Todo({
    required this.title,
    required this.id,
    required this.userId,
    required this.completed,
  });

//Objeto tipo Todo com o json mapeado
  factory Todo.fromJson(Map json){
    return Todo(
      title: json['title'],
      id: json['id'],
      userId: json['userId'],   
      completed: json['completed'],
    );
  }

//Retornando o objeto no tipo Json
  Map toJson(){
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'userId': userId,
    };
  }
}