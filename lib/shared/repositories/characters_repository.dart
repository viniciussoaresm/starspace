import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starspace/shared/elements.dart';
import 'package:starspace/shared/models/character.dart';

import 'charecters_repository_interface.dart';

class CharactersRepository implements CharactersRepositoryInterface {
  Future<List<Character>> getAll() async {
    List<Character> list = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? charsList = sharedPreferences.getString("charsList");

    if (charsList != null) {
      dynamic data = jsonDecode(charsList);
      data.forEach((element) {
        list.add(Character.fromJson(element));
      });
    } else {
      await FirebaseFirestore.instance
          .collection("characters")
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          sharedPreferences.setString("charsList", jsonEncode(result));
          list.add(Character.fromJson(result.data()));
        });
      });
    }

    return list;
  }
}
