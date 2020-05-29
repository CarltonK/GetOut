import 'package:flutter/material.dart';
import 'package:getout/provider/indexNotifier.dart';
import 'package:getout/screens/on_boarding.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Out',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => IndexNotifier(),
        child: OnBoarding()
      ),
    );
  }
}
