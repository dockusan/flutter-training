import 'package:flutter/material.dart';
import 'models/Record.dart';
import 'helper/URLLauncher.dart';

class DetailPage extends StatelessWidget {
  final Record record;

  DetailPage({this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(record.name),
      ),
      body: ListView(
        children: <Widget>[
          Hero(
            tag: "avatar_" + record.name,
            child: Image.network(record.photo),
          ),
          GestureDetector(
            onTap: () {
              URLLauncher().launchURL(record.url);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Name " + record.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.only(bottom: 8),
                        ),
                        Text(
                          "Address: " + record.address,
                          style: TextStyle(color: Colors.grey[500]),
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.red[500],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("${record.contact}"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
