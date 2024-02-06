import 'dart:convert';

import 'package:api_project/models/bitcoin_api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitConiScreen extends StatefulWidget {
  const BitConiScreen({super.key});

  @override
  State<BitConiScreen> createState() => _BitConiScreenState();
}

class _BitConiScreenState extends State<BitConiScreen> {
  Future<BitCoin> getapi() async {
    String url = "https://api.coindesk.com/v1/bpi/currentprice.json";
    final responsedata = await http.get(Uri.parse(url));
    final jsonconvert = json.decode(responsedata.body);
    return BitCoin.fromJson(jsonconvert);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getapi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                Card(
                  child: ListTile(
                    tileColor: Colors.amber,
                    title: Text(
                      snapshot.data!.time.updated.toString(),
                    ),
                    subtitle: Text(
                      snapshot.data!.bpi.usd.toString(),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    tileColor: Colors.amber,
                    title: Text(
                      snapshot.data!.bpi.gbp.description,
                    ),
                    subtitle: Text(
                      snapshot.data!.bpi.gbp.rate.toString(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
