import 'package:api_cekme/model_view/my_home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyhomeViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'the ricky and morty app',
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<MyhomeViewModel>(
          builder: (context, value, child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(value.characters.first.name.toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
