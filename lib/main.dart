import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_training/productsProvider.dart';
import 'package:provider_training/screens/home-screen.dart';

void main() {
  runApp(ChangeNotifierProvider<products>(
    create: (_) => products(),
    child:MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add a product',
      home: homeScreen(),
    );
  }
}
