import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () => {},
            color: Colors.blueAccent,
            child: Text(
              "Arama Sayfası",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
