import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './notelistscreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final notesController = TextEditingController();

  Future<void> setNotesData(noteValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('noteData', noteValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  hintText: 'Enter a text to save...',
                  label: Text('Text'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setNotesData(notesController.text);
                },
                child: Text('Save Text'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteList(),
                    ),
                  );
                },
                child: Text('View Saved Texts'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
