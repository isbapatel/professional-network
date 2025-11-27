import 'package:flutter/material.dart';
import '../app_state.dart';
import '../widgets/post_card.dart';
import 'create_post.dart';

class HomeFeedScreen extends StatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  State<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends State<HomeFeedScreen> {
  @override
  Widget build(BuildContext context) {
    final posts = AppState().posts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("WT Winds"),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePostScreen()),
          );
          setState(() {}); // refresh feed after posting
        },
        child: const Icon(Icons.add),
      ),

      body: posts.isEmpty
          ? const Center(
              child: Text(
                "No posts yet.\nCreate your first post!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final p = posts[index];

                return PostCard(
                  name: p['name'],
                  role: p['role'],
                  time: p['time'] ?? "now",
                  content: p['content'],
                  image: p['image'], // File? type (optional)
                );
              },
            ),
    );
  }
}
