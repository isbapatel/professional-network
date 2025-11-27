import 'package:flutter/material.dart';
import '../widgets/google_button.dart';
import 'create_profile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2A68),
      body: Column(
        children: [
          const SizedBox(height: 160),

          const Text(
            "WT winds",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),

          const Spacer(),

          Container(
            padding: const EdgeInsets.all(28),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              children: [
                const Text("Log in",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Connect with professionals",
                    style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 25),

                GoogleButton(
                  label: "Continue with Google",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
