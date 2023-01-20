// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

void main(){
  print(stringToInt('s'));
}

int stringToInt(String text){

  int value;

  try{
    value = int.parse(text);
  }catch(e){
    throw Exception('O texto passado ($text) não é um número! Passe um número!');
  }
  
  return value;
}
