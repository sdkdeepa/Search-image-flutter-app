import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pic_a_picture_app/search_results/SearchResults.dart';


class HomePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Beautiful Images'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
              constraints: BoxConstraints.tightFor(width: 400.0, height: 400.0),
              child: Image.asset(
                "images/pick-a-pic.png",
                fit: BoxFit.scaleDown,
              )),
          ListTile(
                title: new TextFormField(
                  controller: searchController,
                  decoration: new InputDecoration(
                    labelText: 'Enter a Category',
                    hintText: 'eg: San Francisco, cars , fall colors...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
            ),
          ListTile(
            title: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SearchResults(searchController.text.trim().replaceAll(" ", "+"))));
                },
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white, fontSize:22.0, fontWeight: FontWeight.bold),
                ),
                height: 40.0,
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          )
        ],
      ),
    );
  }
}
