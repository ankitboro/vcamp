import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          20.verticalSpace,
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: user.photoURL ?? "",
            ).withPlaceHolder(),
          ),
          20.verticalSpace,
          Center(
            child: Text(
              user.displayName ?? "N/A",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      )),
    );
  }
}
