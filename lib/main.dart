import 'package:flutter/material.dart';
import 'package:song_webtoon/screens/home_screen.dart';

void main() {
//  ApiService().getTodaysTonns();
  runApp(const SongWebtoon());
}

class SongWebtoon extends StatelessWidget {
  const SongWebtoon({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
