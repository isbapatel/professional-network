import 'dart:io';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String name;
  final String role;
  final String time;
  final String content;
  final File? image;

  const PostCard({
    super.key,
    required this.name,
    required this.role,
    required this.time,
    required this.content,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 22),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(role, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const Spacer(),
              Text(time, style: const TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            content,
            style: const TextStyle(fontSize: 15, height: 1.4),
          ),

          if (image != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(image!, height: 220, width: double.infinity, fit: BoxFit.cover),
            ),
          ],
        ],
      ),
    );
  }
}
