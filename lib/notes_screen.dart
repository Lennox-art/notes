
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<String> _notes = [];
  final TextEditingController _textController = TextEditingController();

  void _addNote() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _notes.add(_textController.text);
        _textController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        centerTitle: true, // Centering the title for more style
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter your note',
                labelStyle: const TextStyle(color: Colors.black), // Blue label
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addNote,
            child: const Text('Add Note'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(
                      _notes[index],
                      style: const TextStyle(color: Colors.blue),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                       showDialog(
                            context: context,
                            builder: (_) => EditNoteDialog(
                              notes: _notes,
                              index: index,
                              onDeleteNote: (i) {
                                //TODO: Find out why i have used set state instead of just _notes.removeAt(i);
                                setState((){
                                _notes.removeAt(i);
                                });
                              },
                              onEditNote: (i, newNote) {
                                setState((){
                                  _notes[i] = newNote;
                                });
                              },
                          ),
                          ); 
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



class EditNoteDialog extends StatelessWidget {
   EditNoteDialog({
    super.key, 
    required this.notes,
    required this.index,
    required this.onEditNote,
    required this.onDeleteNote,
   });

  final List<String> notes;
  final int index;
  final Function(int index, String note) onEditNote;
  final Function(int index) onDeleteNote;

  late final TextEditingController controller = TextEditingController(text: notes[index]);

  @override
  Widget build(BuildContext context) {
   return Dialog(
    child: Column(
      //mainAxisSize: mainAxisSize.min,
      children: [
        TextFormField(
          controller: controller,
        ),
        IconButton(icon: Icon(Icons.check), onPressed: () {
          //TODO: Save note
          onEditNote(index, controller.text);
          Navigator.of(context).pop();
        },),
        IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () {
          //TODO: Delete note
          onDeleteNote(index);
           Navigator.of(context).pop();
        },),
      ],
    )
   ); 
  }
}