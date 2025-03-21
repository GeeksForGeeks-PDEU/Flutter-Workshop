import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'important.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({Key? key}) : super(key: key);

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  List<File> homeworkImages = [];
  final ImagePicker _picker = ImagePicker();

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
              const SizedBox(height: 10),

              // Video tutorials section
              const Text(
                "Your Pending Video Tutorial",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              // Video card with image
              const VideoTutorialCard(
                subject: "Science",
                unit: "Unit 1",
                thumbnailPath: "assets/images/science_thumbnail.jpg",
              ),

              const SizedBox(height: 20),

              // Homework section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Maths Homework",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.white),
                    onPressed: _pickImage,
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Homework content area
              Expanded(
                child: HomeworkSection(
                  images: homeworkImages,
                  onDeleteImage: (index) {
                    setState(() {
                      homeworkImages.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        homeworkImages.add(File(image.path));
      });
    }
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
              color: Colors.white,
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

// Category selector component
class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  const CategorySelector({
    Key? key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CategoryButton(
              label: categories[index],
              isSelected: selectedIndex == index,
              onTap: () {
                onCategorySelected(index);

                // Navigation logic based on category selection
                if (categories[index] == 'Important') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Important_Screen(),
                    ),
                  );
                } else if (categories[index] == 'Study') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudyScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Individual category button
class CategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label.isEmpty) return const SizedBox(width: 10);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
          color: isSelected ? Colors.white10 : Colors.transparent,
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// Video tutorial card component with simplified design
class VideoTutorialCard extends StatelessWidget {
  final String subject;
  final String unit;
  final String thumbnailPath;

  const VideoTutorialCard({
    Key? key,
    required this.subject,
    required this.unit,
    required this.thumbnailPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9C3), // Light yellow color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left side - subject and unit information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Homework section component
class HomeworkSection extends StatelessWidget {
  final List<File> images;
  final Function(int) onDeleteImage;

  const HomeworkSection({
    Key? key,
    required this.images,
    required this.onDeleteImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: images.isEmpty
          ? const Center(
              child: Text(
                "No homework submissions yet.\nTap the + button to upload photos.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 0; i < images.length; i++)
                    HomeworkImageItem(
                      image: images[i],
                      onDelete: () => onDeleteImage(i),
                    ),
                ],
              ),
            ),
    );
  }
}

// Individual homework image item
class HomeworkImageItem extends StatelessWidget {
  final File image;
  final VoidCallback onDelete;

  const HomeworkImageItem({
    Key? key,
    required this.image,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Stack(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              image,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          // Delete button
          Positioned(
            right: 8,
            top: 8,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
