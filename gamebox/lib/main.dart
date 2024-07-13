import 'package:flutter/material.dart';
import 'pages/loading_page.dart'; // Import the loading page

void main() {
  runApp(GameBoxApp());
}

class GameBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}
