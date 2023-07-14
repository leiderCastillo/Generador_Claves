

import 'dart:math';

import 'package:flutter/material.dart';

String generatepassword(int lenght,bool num, bool may, bool min, bool sym){
  String password = "";
  int opciones = 0;
  List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  List<String> lettersMin = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  List<String> lettersMay = lettersMin.map((Element) => Element.toUpperCase()).toList();
  List<String> symbols = ['!', '@', '#', '%', '^', '&', '*', '(', ')', '-', '_', '+', '=', '{', '}', '[', ']', '|', ':', ';', ',', '.', '<', '>', '/', '?'];

  List<List<String>> listas = [];
  if(num){listas.add(numbers);opciones++;}
  if(min){listas.add(lettersMin);opciones++;}
  if(may){listas.add(lettersMay);opciones++;}//TODO PASAR A MIN O MAY
  if(sym){listas.add(symbols);opciones++;}

  for(int i = 0; i < lenght ;  i++){
    if(i < opciones){
      List<String> listtemp = listas[i];
      password = "$password${listtemp[Random().nextInt(listtemp.length)]}";

    }else{
      List<String> listtemp = listas[Random().nextInt(opciones)];
      password = "$password${listtemp[Random().nextInt(listtemp.length)]}";
    }
  }
  return password;
}
