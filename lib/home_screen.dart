import 'dart:convert';

import 'package:api_project/models/easy_api_file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//Thids file will received Json data from apitesting folder and the file name is easy_api.json
  Future<Student> loaddata() async {
    var loadata = await rootBundle.loadString('apitesting/easy_api.json');
    var jsondecodedata = await json.decode(loadata);
    return Student.fromjson(jsondecodedata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loaddata(),
        builder: (context, AsyncSnapshot<Student?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListTile(
                tileColor: Colors.amber,
                title: Text(snapshot.data!.name.toString()),
                subtitle: Text(snapshot.data!.age.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
