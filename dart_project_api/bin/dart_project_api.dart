import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async{
  final json = await fetch();

  print(json);
  print(json['title']);
}

//Tipando a future em Map, por conta da conversão em json
Future<Map> fetch() async{
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));

  print(response.body);

  //transformando em json
  var json = jsonDecode(response.body);

  return json;
}