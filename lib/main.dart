import 'package:flutter/material.dart';
import 'package:notes_app/important.dart';
import 'package:notes_app/newnote.dart';
import 'package:notes_app/study.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = []; // Store notes
  String selectedCategory = "All"; // Track selected filter

  void _addNewNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Newnote()),
    );

    if (result != null) {
      setState(() {
        notes.add(result); // Save new note
      });
    }
  }

  void _navigateToCategory(String category) {
    setState(() {
      selectedCategory = category;
    });

    if (category == "Important") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Important_Screen()));
    } else if (category == "Study") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StudyScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("My Notes",
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [
          FloatingActionButton(
            onPressed: _addNewNote,
            backgroundColor: Colors.green[300],
            child: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FilterChipWidget(
                    label: "All (${notes.length})",
                    isSelected: selectedCategory == "All",
                    onTap: () => _navigateToCategory("All"),
                  ),
                  FilterChipWidget(
                    label: "Important",
                    isSelected: selectedCategory == "Important",
                    onTap: () => _navigateToCategory("Important"),
                  ),
                  FilterChipWidget(
                    label: "Study",
                    isSelected: selectedCategory == "Study",
                    onTap: () => _navigateToCategory("Study"),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Default Notes
              Row(
                children: [
                  Expanded(
                    child: NoteCard(
                      title: "Quote of Day",
                      content:
                          "You have to believe in yourself when no one else does.",
                      color: Color(0xFF99BC85),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: NoteCard(
                      title: "Plan for the day",
                      content: "✓ Drink Water\n○ Gym\n✓ Meeting",
                      color: Color(0xFFEC5228),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              NoteCard(
                title: "My Lectures",
                content: "",
                color: Color(0xFFFFCF50),
              ),
              SizedBox(height: 16),

              // User-added Notes
              ...notes.map((note) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: NoteCard(
                      title: note['title'],
                      content: note['content'],
                      color: note['color'] ?? Color(0xFFE8F9FF),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  FilterChipWidget(
      {required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: isSelected
                ? BorderSide(color: Colors.white, width: 1.5)
                : BorderSide.none,
          ),
          backgroundColor: isSelected ? Colors.white : Colors.grey.shade800,
          label: Text(label,
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal)),
        ),
      ),
    );
  }
}

// Reusable Note Card
class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final Color color;

  NoteCard({required this.title, required this.content, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}
