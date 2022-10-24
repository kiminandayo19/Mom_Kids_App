import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final String searchType;
  const SearchBox({Key? key, required this.searchType}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.0,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 52.0, left: 16.0, right: 16.0, bottom: 12.0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4d918f), Color(0xff8ec3b3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
      child: TextField(
        style: TextStyle(
          fontFamily: 'Avenir-Regular',
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: BorderSide.none,
          ),
          hintText: widget.searchType == "consultation" ? 'Cari Dokter' : 'Cari artikel',
          hintStyle: const TextStyle(
              color: Color(0xFF808080),
              fontSize: 15,
              fontFamily: "Avenir-Regular"
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF808080),),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}