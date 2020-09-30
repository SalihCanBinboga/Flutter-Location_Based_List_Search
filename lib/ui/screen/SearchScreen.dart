import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreenViewModel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


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
          _searchTextField,
          _resultListView,
        ],
      ),
    );
  }

  get _resultListView => Flexible(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            List<String> _resultList = context.watch<SearchScreenViewModel>().searchResultList;
            return ListTile(
              leading: Icon(Icons.location_on),
              title: Text(_resultList[index]),
              onTap: () {
                print('Selected City Index $index');
              },
            );
          },
          itemCount: context.watch<SearchScreenViewModel>().searchResultList.length,
        ),
      );
  get _searchTextField => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          //enabled: context.watch<SearchScreenViewModel>().state != SearchState.Searching ? true : false,
          decoration: InputDecoration(
            hintText: "Ara",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            prefixIcon: Icon(Icons.search),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          maxLength: 22,
          onChanged: (String text) {
            context.read<SearchScreenViewModel>().searchText(text);
          },
        ),
      );
}
