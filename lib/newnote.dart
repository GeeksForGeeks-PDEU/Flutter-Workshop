import 'package:flutter/material.dart';

class Newnote extends StatefulWidget {
  @override
  _NewnoteState createState() => _NewnoteState();
}

class _NewnoteState extends State<Newnote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  Color _backgroundColor =
      const Color.fromRGBO(250, 241, 230, 1); // Default color

  void _saveNote() {
    if (_titleController.text.isNotEmpty ||
        _contentController.text.isNotEmpty) {
      Navigator.pop(context, {
        'title': _titleController.text,
        'content': _contentController.text,
        'color': _backgroundColor,
      });
    } else {
      Navigator.pop(context);
    }
  }

  // Function to show color picker
  void _showColorPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _colorOption(Colors.white),
              _colorOption(Colors.yellow[100]!),
              _colorOption(Colors.green[100]!),
              _colorOption(Colors.blue[100]!),
              _colorOption(Colors.pink[100]!),
            ],
          ),
        );
      },
    );
  }

  // Function to create color selection button
  Widget _colorOption(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backgroundColor = color;
        });
        Navigator.pop(context); // Close the BottomSheet
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: 22,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.5),
          IconButton(
            onPressed: _saveNote, // Save note when pressed

            icon: const Icon(Icons.add_task, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title TextField
            TextField(
              controller: _titleController,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
              ),
            ),
            SizedBox(height: 10), // Space between title and content

            // Content TextField
            Expanded(
              child: TextField(
                controller: _contentController,
                autofocus: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Write your note here...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showColorPicker(context),
        backgroundColor: Colors.black,
        child: Icon(Icons.color_lens, color: Colors.white),
      ),
    );
  }
}
