import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/model/pokemon.dart';

class PokeInfoPage extends StatefulWidget {
  String pkm;

  PokeInfoPage({super.key, required this.pkm});

  @override
  State<PokeInfoPage> createState() => _PokeInfoPageState();
}

class _PokeInfoPageState extends State<PokeInfoPage> {
  Pokemon pokemon = Pokemon();

  @override
  Widget build(BuildContext context) {
    callPokemon(widget.pkm);

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.getName()),
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            pokemon.getName(),
            style: const TextStyle(fontSize: 30),
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: '' == pokemon.getName()
                ? const Placeholder()
                : Image.network(
                    pokemon.getSprite(),
                  ),
          ),
          Text("${pokemon.getType1()} / ${pokemon.getType2()}",
              style: const TextStyle(fontSize: 30))
        ]),
      ),
    );
  }

  void callPokemon(String pkm) async {
    //print("Calling Pokemon");
    final url = 'https://pokeapi.co/api/v2/pokemon/$pkm/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    var json = jsonDecode(body);
    //print("calling pokemon - complete");
    setState(() {
      pokemon.id = json['id'];
      pokemon.name = json['name'];
      pokemon.sprite =
          json['sprites']["other"]["official-artwork"]["front_default"];
      pokemon.type1 = json['types'][0]['type']['name'];
      pokemon.type2 = json['types'][1]['type']['name'];
    });
    //print("Valores Atribuidos");
  }
}










