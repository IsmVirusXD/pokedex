import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final regioes = [
    "national",
    "kanto",
    "johto",
    "hoenn",
    "sinnoh",
    "unova",
    "alola"
  ];

  String? value;
  List<dynamic> pokemons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        title:
            Text(value == null ? 'Pokedex' : 'Pokedex: ${upperCase(value!)}'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      isExpanded: true,
                      items: regioes.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() {
                        this.value = value;
                        callAPI();
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              SizedBox(
                height: 600,
                width: double.infinity,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemons[index];
                      final name = pokemon['pokemon_species']['name'];
                      return ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(
                          upperCase(name),
                          style: const TextStyle(fontSize: 30),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  void callAPI() async {
    print("Calling API");
    final url;

    switch (value) {
      case "national":
        url = 'https://pokeapi.co/api/v2/pokedex/1/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "kanto":
        url = 'https://pokeapi.co/api/v2/pokedex/2/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "johto":
        url = 'https://pokeapi.co/api/v2/pokedex/7/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "hoenn":
        url = 'https://pokeapi.co/api/v2/pokedex/4/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "sinnoh":
        url = 'https://pokeapi.co/api/v2/pokedex/6/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "unova":
        url = 'https://pokeapi.co/api/v2/pokedex/9/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
      case "alola":
        url = 'https://pokeapi.co/api/v2/pokedex/21/';
        final uri = Uri.parse(url);
        final response = await http.get(uri);
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          pokemons = json['pokemon_entries'];
        });
        //print("calling complete");
        break;
    }
  }

  String upperCase(String text) =>
      "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}
