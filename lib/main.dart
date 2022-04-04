import 'dart:convert';
import 'dart:io';

import 'package:crypto_ticker/splash.dart';
import 'package:crypto_ticker/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Ticker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List listResult = [];
  @override
  void initState() {
    super.initState();
    getCryptoData();
  }

  Future<void> getCryptoData() async {
    String url =
        "https://api.nomics.com/v1/currencies/ticker?key=0c1ad5915b7c249897d8868198991bed74d0ee52&id=BTC&convert=INR&interval=1d,30d&per-page=1000";
    http.Response result = await http.get(Uri.parse(url));
    listResult = jsonDecode(result.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Crypto Ticker',
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: (listResult.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listResult.length,
              itemBuilder: (context, index) {
                return TileClass(
                    imageUrl: listResult[index]['logo_url'],
                    name: listResult[index]['name'],
                    percent: listResult[index]['1d']['price_change_pct'],
                    price: listResult[index]['price'],
                    symbol: listResult[index]['symbol']);
              },
            ),
    );
  }
}
