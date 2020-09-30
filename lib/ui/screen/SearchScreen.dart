import 'package:flutter/material.dart';
import 'package:flutter_location_based_search/ui/screen/SearchScreenViewModel.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  getLocation() {
    context.read<SearchScreenViewModel>().getCityNameBasedLocation();
  }

  _searchTextField(viewmodel) => Padding(
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
            suffixIcon: GestureDetector(
              onTap: getLocation,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Icon(Icons.location_searching),
              ),
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          maxLength: 22,
          onChanged: (String text) {
            viewmodel.searchText(text);
          },
        ),
      );

  _resultListView(viewmodel) => Flexible(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            List<String> _resultList = viewmodel.searchResultList;
            return ListTile(
              leading: Icon(Icons.location_on),
              title: Text(_resultList[index]),
              onTap: () {
                Navigator.of(context).pop(_resultList[index]);
              },
            );
          },
          itemCount: viewmodel.searchResultList.length,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenViewModel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.locationState == LocationState.Found) {
          Navigator.of(context).pop(viewmodel.resultLocationCity);
          viewmodel.setLocationNotFound();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Nereden ?"),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _searchTextField(viewmodel),
              _resultListView(viewmodel),
            ],
          ),
        );
      },
      child: Center(
        child: Text("text"),
      ),
    );
  }
}
