import 'dart:convert';

import 'package:api_project/models/cricket_mdel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<CricketModel> getcricketdata() async {
    var getdata = await rootBundle.loadString('apitesting/cricketer_data.json');
    var decodedata = await jsonDecode(getdata);
    return CricketModel.fromjson(decodedata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getcricketdata(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Text(snapshot.data!.name.toString())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Text(snapshot.data!.Location.toString())),
              ),
              const Text('List Data Showint'),
              ...List.generate(snapshot.data!.playerid.length, (index) {
                return Card(
                    color: Colors.amber,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(snapshot.data!.playerid[index].toString()));
              }),
              const Text('Attributes Data is showing'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Text(snapshot.data!.attributes.height.toString())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Text(snapshot.data!.attributes.best.toString())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Text(snapshot.data!.attributes.fiftyies.toString())),
              ),
            ],
          );
        },
      ),
    );
  }
}
// https://jsonplaceholder.typicode.com/users