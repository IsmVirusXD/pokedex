import 'package:flutter/material.dart';

class PokeCards extends StatelessWidget {

  final String Name;
  final String Type;
  final Colors colortype;
  final List<int> Status;

  const PokeCards({super.key, required this.Name, required this.Type, required this.colortype, required this.Status});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}