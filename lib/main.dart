
import 'package:flutter/material.dart';
import 'package:flutter_scratch_notebook/notebooks/notebook.dart';
import 'package:provider/provider.dart';

import 'notebooks/notebook_model.dart';

void main() {



  final nbmodel = NotebookModel();
  nbmodel.add(const Note(1, 'Time and Tide'));
  nbmodel.add(const Note(2, 'Upside down'));
  nbmodel.add(const Note(3, 'In and Out'));
  nbmodel.add(const Note(4, 'World turns'));
  nbmodel.add(const Note(5, 'Ride Sally Ride'));


  runApp(
    ChangeNotifierProvider(
      create: (context) => nbmodel,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = "Hello World";
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text("Your Notebook"),
            actions: <Widget>[
              IconButton( 
                icon: const Icon(Icons.settings),
                tooltip: "Settings",
                onPressed: () {

                },
              )
            ]
          ),
          Notebook(),
        ],
      ),
    );
  }
}
