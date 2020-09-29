import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nereden ?"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text("Location Icon"),
                  title: Text("City/District Name $index"),
                  onTap: () {
                    print('Selected City Index $index');
                  },
                );
              },
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
