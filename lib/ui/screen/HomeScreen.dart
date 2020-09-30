import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen())).then(
                  (value) => print('Seçilen Konum $value'),
                ),
          },
          color: Colors.blueAccent,
          child: Text(
            "Arama Sayfası",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
