// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:my_api/Model/model.dart';
import 'package:my_api/Service/service.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Main?> data = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api"),
      ),
      body: FutureBuilder<Main>(
        future: pasrejson(),
        builder: (context, AsyncSnapshot<Main> snapshot) {
          var deger = snapshot.data!.temp! - 273;
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(
                        "${deger.toStringAsFixed(0)} C",
                      ),
                      subtitle: const Text("temp"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data!.humidity.toString(),
                      ),
                      subtitle: const Text("Humidity"),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data!.feelsLike.toString(),
                      ),
                      subtitle: const Text("FeelsLike"),
                    ),
                  ),
                ],
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
