import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/components/CustomAlertDialog.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreen.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  stt.SpeechToText _sttInstance;
  bool isStartListen = false;
  String _listenResult = "Listen Result";

  @override
  void initState() {
    super.initState();
    _sttInstance = stt.SpeechToText();
  }

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
              child: Text(isStartListen ? "Dinlemeyi Durdur" : "Dinlemeye Başla"),
            ),
            Text(_listenResult)
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

  _startListening() async {
    if (!isStartListen) {
      bool speechInit = await _sttInstance.initialize(onStatus: (String status) {
        print('onStatus: $status');
      }, onError: (SpeechRecognitionError error) {
        print('onError ${error.errorMsg}');
      });

      if (speechInit) {
        setState(() => isStartListen = true);

        _sttInstance.listen(
          onResult: (SpeechRecognitionResult result) {
            setState(() {
              _listenResult = result.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() {
        isStartListen = false;
        _sttInstance.stop();
      });
    }
  }
}
