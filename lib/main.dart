
import 'package:flutter/material.dart';
import 'package:flutter_scratch_notebook/notebooks/notebook.dart';
import 'package:provider/provider.dart';

import 'notebooks/notebook_model.dart';

const LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at enim bibendum, elementum nisl vitae, aliquam ipsum. Aenean ut est ante. Phasellus sagittis nunc ut malesuada volutpat. In quis fringilla nisi. Nam porttitor gravida mauris et vehicula. Ut nec condimentum risus. In hac habitasse platea dictumst. Fusce sit amet massa a nunc euismod varius. Donec euismod ex in consectetur egestas. Suspendisse in odio iaculis, laoreet libero vel, gravida urna. Phasellus sollicitudin ipsum et felis ullamcorper, in venenatis diam mattis. Nullam ut velit dolor. Nunc varius commodo vehicula.";

void main() {
  runApp(NotebooksApp());
}

class NotebooksApp extends StatelessWidget {
  const NotebooksApp({super.key});

  @override
  Widget build(BuildContext context) {

    final nbmodel = NotebookModel();
    // add some sample data
    nbmodel.add(const Note(1, 'Time and Tide', LOREM));
    nbmodel.add(const Note(2, 'World turns', LOREM));
    nbmodel.add(const Note(3, 'Upside down', LOREM));
    nbmodel.add(const Note(4, 'In and Out', LOREM));
    nbmodel.add(const Note(5, 'Ride Sally Ride', LOREM));

    return ChangeNotifierProvider(
      create: (context) => nbmodel,
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomePage(),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
