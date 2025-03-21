import 'package:flutter/material.dart';

class Important_Screen extends StatefulWidget {
  const Important_Screen({Key? key}) : super(key: key);

  @override
  State<Important_Screen> createState() => _Important_ScreenState();
}

class _Important_ScreenState extends State<Important_Screen> {
  // Sample to-do items (with completion status)
  List<TodoItem> todoItems = [
    TodoItem(title: 'Drink Water', isCompleted: true),
    TodoItem(title: 'Gym', isCompleted: true),
    TodoItem(title: 'Meeting', isCompleted: true),
  ];

  // Sample lecture items
  List<LectureItem> lectureItems = [
    LectureItem(
        time: '10:00 AM',
        title: 'Cyber security',
        location: 'E-303, Utkarsh Tiwari'
    ),
    LectureItem(
        time: '11:30 AM',
        title: 'Cloud computing',
        location: 'E-302, Rajeev Gupta'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App header with title and add button
              const AppHeader(),
              const SizedBox(height: 20),

              // Today's schedule section
              const Text(
                "Today's schedule",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              // Todo items list
              TodoList(todoItems: todoItems),

              const SizedBox(height: 16),

              // Lectures section
              LecturesCard(lectures: lectureItems),
            ],
          ),
        ),
      ),
    );
  }
}

// Header with title and add button
class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'My Notes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

// Todo item model
class TodoItem {
  final String title;
  bool isCompleted;
  bool isImportant;

  TodoItem({
    required this.title,
    this.isCompleted = false,
    this.isImportant = false,
  });
}

// Todo list component
class TodoList extends StatelessWidget {
  final List<TodoItem> todoItems;

  const TodoList({
    Key? key,
    required this.todoItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: todoItems.map((item) => TodoItemWidget(item: item)).toList(),
    );
  }
}

// Todo item widget
class TodoItemWidget extends StatefulWidget {
  final TodoItem item;

  const TodoItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: () {
              setState(() {
                widget.item.isCompleted = !widget.item.isCompleted;
              });
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                color: widget.item.isCompleted ? Colors.grey : Colors.transparent,
              ),
              child: widget.item.isCompleted
                  ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.black,
              )
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          // Text
          Text(
            widget.item.title,
            style: TextStyle(
              fontSize: 16,
              decoration: widget.item.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: widget.item.isCompleted ? Colors.grey : Colors.white,
              decorationColor: Colors.grey,
              decorationThickness: 2,
            ),
          ),
          const Spacer(),
          // Star icon for important items
          GestureDetector(
            onTap: () {
              setState(() {
                widget.item.isImportant = !widget.item.isImportant;
              });
            },
            child: Icon(
              widget.item.isImportant ? Icons.star : Icons.star_border,
              color: widget.item.isImportant ? Colors.amber : Colors.grey,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

// Lecture item model
class LectureItem {
  final String time;
  final String title;
  final String location;

  LectureItem({
    required this.time,
    required this.title,
    required this.location,
  });
}

// Lectures card component
class LecturesCard extends StatelessWidget {
  final List<LectureItem> lectures;

  const LecturesCard({
    Key? key,
    required this.lectures,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Lectures',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          // Lecture items
          ...lectures.map((lecture) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: LectureItemWidget(lecture: lecture),
          )),
        ],
      ),
    );
  }
}

// Individual lecture item
class LectureItemWidget extends StatelessWidget {
  final LectureItem lecture;

  const LectureItemWidget({
    Key? key,
    required this.lecture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.amber[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time
            SizedBox(
              width: 70,
              child: Text(
                lecture.time,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            // Title and location
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lecture.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    lecture.location,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}