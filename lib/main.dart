import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreenViewModel.dart';
import 'package:provider/provider.dart';
import 'ui/screen/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchScreenViewModel(context),
      child: MaterialApp(
        title: "Flutter Locatin Based Search",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
