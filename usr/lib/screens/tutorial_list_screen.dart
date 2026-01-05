import 'package:flutter/material.dart';
import '../models/tutorial_data.dart';
import 'tutorial_detail_screen.dart';

class TutorialListScreen extends StatelessWidget {
  const TutorialListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurikulum Perakitan'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: curriculumData.length,
        itemBuilder: (context, index) {
          final module = curriculumData[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.withOpacity(0.2),
                child: Icon(IconData(module.icon.codePoint, fontFamily: 'MaterialIcons'), color: Colors.blue),
              ),
              title: Text(
                module.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(module.description),
              children: module.steps.map((step) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 72, right: 16),
                  title: Text(step.title),
                  trailing: const Icon(Icons.play_circle_outline, color: Color(0xFF00E5FF)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorialDetailScreen(step: step),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
