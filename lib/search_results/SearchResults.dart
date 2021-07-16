import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_a_picture_app/network/ClientApi.dart';

class SearchResults extends StatefulWidget {
  String category;
  SearchResults(this.category);
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    print(widget.category);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Pick a Pic',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getPics(widget.category),
          builder: (context, snapshot) {
            final Map data = snapshot.data;
            print(snapshot);
            if (snapshot.hasError) {
              return Text(
                'Failed to get response from server',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: (data["hits"] as List).length,
                  itemBuilder: (context, index) {
                    return Container(
                        constraints:
                            BoxConstraints.tightFor(width: 0.0, height: 200.0),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 10, 0),
                          title: Image.network(
                            data['hits'][index]['largeImageURL'],
                            fit: BoxFit.fitWidth,
                          ),
                        ));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
