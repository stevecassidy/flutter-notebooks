
import 'package:flutter/material.dart';
import 'package:flutter_scratch_notebook/notebooks/notebook_model.dart';
import 'package:provider/provider.dart';

class Notebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<NotebookModel>( 
      builder: (context, notebook, child) => 
          ListView(
            shrinkWrap: true,
            children: [
              for(var note in notebook.notes)
                ListTile( 
                  title: Text(note.title),
                  leading: const Icon(Icons.note),
                ),
            ]
          ),
      );
  }
}