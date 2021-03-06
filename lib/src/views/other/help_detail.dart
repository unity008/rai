import 'package:RAI/src/models/help.dart';
import 'package:RAI/src/wigdet/appbar.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class HelpDetailPage extends StatelessWidget {
  final String categoryName;
  Article detail;
  HelpDetailPage(this.categoryName, this.detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OneupBar(categoryName),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 5),
                child: Text(detail.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor, letterSpacing: -0.5), textAlign: TextAlign.left,),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Pigment.fromString("#F6FBFF")
                ),
                child: Text(detail.body, style: TextStyle(fontSize: 15, color: Theme.of(context).primaryColor, height: 1.5), textAlign: TextAlign.left)
              )
            ],
          ),
        ],
      )
    );
  }
}