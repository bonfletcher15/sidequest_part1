import 'package:flutter/material.dart';

void main() 
{
  runApp(WordCounterApp());
}

class WordCounterApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Word Counter App'),
        ),
        body: WordCounterWidget(),
      ),
    );
  }
}

class WordCounterWidget extends StatefulWidget 
{
  @override
  _WordCounterWidgetState createState() => _WordCounterWidgetState();
}

class _WordCounterWidgetState extends State<WordCounterWidget> 
{
  String inputText = '';
  int wordCount = 0;

  void countWords() 
  {
    setState(()
     {
      List<String> words = inputText.split(RegExp(r'[ .,]+'));
      words = words.where((word) => word.isNotEmpty).toList();
      wordCount = words.length;
    });
  }

  @override
  Widget build(BuildContext context) 
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            maxLines: null,
            onChanged: (text) 
            {
              inputText = text;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter text here',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: countWords,
          child: Text('Count Words'),
        ),
        SizedBox(height: 20.0),
        Text('Word Count: $wordCount'),
      ],
    );
  }
}