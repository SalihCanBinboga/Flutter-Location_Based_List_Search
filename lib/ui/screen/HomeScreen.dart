import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/components/CustomAlertDialog.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen())).then(
                      (value) => showCustomDialog(value, context),
                    ),
              },
              color: Colors.blueAccent,
              child: Text(
                "Arama Sayfası",
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton(
              onPressed: () => _startListening(),
              child: Text("Sesi Dinle"),
            )
          ],
        ),
      ),
    );
  }

  showCustomDialog(value, BuildContext context) {
    CustomAlertDialog(
      context: context,
      buttonType: DialogButtonType.SINGLE_BUTTON,
      title: "Seçilen Konum",
      description: Text("Seçilen Konum: $value"),
    ).show();
  }

  _startListening() {

  }
}
