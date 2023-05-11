/*import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model/pokemon.dart';

class PokemonAPI {
/*
  static Future<Map> callPokemon(String name) async {
    print("Calling Pokemon");
    final url = 'https://pokeapi.co/api/v2/pokedex/{$name}/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    var json = jsonDecode(body);
    print("calling pokemon - complete");
    id = json['id'];
    name = json['name'];
    return json;
  }

*/

  static Future<List<Pokemon>> callAPI() async {
    List<Pokemon> pokedex = [];
    print("Calling API");
    const url = 'https://pokeapi.co/api/v2/pokedex/2/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print("calling complete");
    final result = json['pokemon_entries'] as List<dynamic>;
    for (int i = 0; i < result.length; i++) {
      final element = result[i]["entry_number"];
      print("calling {$element}");
      final pkurl = 'https://pokeapi.co/api/v2/{$element}/';
      final pkuri = Uri.parse(pkurl);
      final pkresponse = await http.get(pkuri);
      print(pkresponse);
      //final pkbody = pkresponse.body;
      // final pkjson = jsonDecode(pkbody);
      // final pkid = pkjson["id"].toString();
      // final pkname = pkjson["name"].toString();
      // final pksprite = pkjson["sprites"]["front_default"].toString();
      // final pktype = pkjson["types"];
      // final type01 = pktype[0]["name"];
      // final type02 = pktype[1]["name"];
      // pokedex.add(Pokemon(pkid, pkname, pksprite, type01, type02));
    }
    ;

    return pokedex;
  }
}
*/