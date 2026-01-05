import 'package:flutter/material.dart';
import '../models/tutorial_data.dart';

class TutorialDetailScreen extends StatelessWidget {
  final TutorialStep step;

  const TutorialDetailScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 1. Video Player Placeholder (Top of screen for "Clean UI")
            // Addressing User Request: "How to present video and text together without clutter"
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.black,
                  child: const Center(
                    child: Icon(Icons.play_circle_fill, size: 64, color: Colors.white54),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Text(
                    'Video Tutorial Placeholder',
                    style: TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
              ],
            ),

            // 2. Scrollable Text Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00E5FF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Step Content
                    Text(
                      step.content,
                      style: const TextStyle(fontSize: 16, height: 1.6),
                    ),
                    
                    const SizedBox(height: 24),

                    // Warning / Common Mistakes Section
                    if (step.warning.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          border: Border.all(color: Colors.red.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.warning_amber_rounded, color: Colors.red),
                                SizedBox(width: 8),
                                Text(
                                  'KESALAHAN UMUM',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              step.warning,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                      
                    const SizedBox(height: 24),
                    
                    // Affiliate / Monetization Placeholder
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.shopping_cart, color: Colors.greenAccent),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text('Butuh alat atau komponen ini? Beli di toko rekomendasi kami.'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Beli'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
