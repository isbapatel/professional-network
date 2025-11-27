import 'dart:io';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  final String name;
  final String role;
  final File? image;

  const UserProfileScreen({
    super.key,
    required this.name,
    required this.role,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundImage: image != null ? FileImage(image!) : null,
            ),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(role, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
