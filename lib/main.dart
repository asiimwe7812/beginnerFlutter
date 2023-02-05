import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple), home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randonWordPair = <WordPair>[];
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();
        final index = item ~/ 2;
        if (index >= _randonWordPair.length) {
          _randonWordPair.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randonWordPair[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WordPair')),
      body: _buildList(),
    );
  }
}
