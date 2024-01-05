import 'dart:convert' as convert;

import 'package:api_cekme/model/my_home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyhomeViewModel with ChangeNotifier {
  final List<Character> _characters = [];

  MyhomeViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getCharacters();
    });
  }

  void getCharacters() async {
    const String apiUrl = "https://rickandmortyapi.com/api/character";
    Uri uri = Uri.parse(apiUrl);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> allcharacters = (convert.jsonDecode(response.body)
          as Map<String, dynamic>)["results"];
      for (Map<String, dynamic> currentCh in allcharacters) {
        Character character = Character.fromMap(currentCh);
        _characters.add(character);
      }
    }
    notifyListeners();
  }

  List<Character> get characters => _characters;
}
