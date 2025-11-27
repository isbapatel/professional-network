import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../app_state.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController postController = TextEditingController();
  File? postImage;

  // pick image
  Future<void> pickImage() async {
    final XFile? img =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() => postImage = File(img.path));
    }
  }

  // publish post
  void publishPost() {
    final text = postController.text.trim();
    if (text.isEmpty && postImage == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Write something")));
      return;
    }

    // ONLY send allowed parameters
    AppState().addPost(
      content: text,
      image: postImage,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
        actions: [
          TextButton(
            onPressed: publishPost,
            child: const Text("Post"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: postController,
              decoration: const InputDecoration(
                hintText: "Share something...",
                border: InputBorder.none,
              ),
              maxLines: 5,
            ),

            const SizedBox(height: 10),

            if (postImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(postImage!, height: 200),
              ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: pickImage,
              icon: const Icon(Icons.image),
              label: const Text("Add Image"),
            ),
          ],
        ),
      ),
    );
  }
}
