import 'package:flutter/material.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/models/user_profile_model.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var profile = dineshProfile.data;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 150,
                color: AppColors.primaryColor,
              ),
              Positioned(
                left: 0,
                bottom: -50,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/default_user.png",
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 24,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profile.name),
              Text(profile.email),
            ],
          ),
        ],
      ),
    );
  }
}
