import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appname = "custom thems";
    return MaterialApp(
        title: appname,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color.fromARGB(255, 14, 130, 193),
            fontFamily: 'Georgia',
            textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
            )),
        home: const MyHomePage(
          title: appname,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              'Text with a background color',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        floatingActionButton: Theme(
          data: ThemeData(
            splashColor: Colors.yellow,
          ),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ));
  }
}
