import 'dart:convert';

import 'package:api_project/models/video_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShowVideoScreen extends StatefulWidget {
  const ShowVideoScreen({super.key});

  @override
  State<ShowVideoScreen> createState() => _ShowVideoScreenState();
}

class _ShowVideoScreenState extends State<ShowVideoScreen> {
  Future<VideoModel> getapidata() async {
    String url = "https://www.boredapi.com/api/activity";
    final response = await http.get(Uri.parse(url));

    final decodedata = await jsonDecode(response.body);
    return VideoModel.fromJson(decodedata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<VideoModel>(
            future: getapidata(),
            builder: (context, AsyncSnapshot<VideoModel> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final result = snapshot.data!;
              return ListView.builder(
                itemCount: result.activity.length,
                itemBuilder: (BuildContext context, int index) {
                  print("result is" + result.activity.length.toString());
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Column(
                        children: [
                          Center(child: Text(result.activity[index])),
                        ],
                      ),
                    ),
                  );
                },
              );
            }));
  }
}
