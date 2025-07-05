import 'package:flutter/material.dart';

class SearchMovie extends StatefulWidget {
  const SearchMovie({super.key});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
