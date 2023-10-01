import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';

import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/helpers/show_toast.dart';
import 'package:vcamp/models/profile_model.dart';
import 'package:vcamp/widgets/custom_textfield.dart';

class UpdateProfileScreen extends StatefulWidget {
  final ProfileData? profileData;
  const UpdateProfileScreen({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final preferencesController = TextEditingController();
  final allergiesController = TextEditingController();
  final dietaryRestrictionsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    var profile = widget.profileData;

    nameController.text = profile?.name ?? "";
    preferencesController.text = profile?.preferences?.join(", ") ?? "";
    allergiesController.text = profile?.allergies?.join(", ") ?? "";
    dietaryRestrictionsController.text =
        profile?.dietaryRestrictions?.join(", ") ?? "";
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left_outlined),
          color: Colors.black,
        ),
        title:
            const Text('Update Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdatedState) {
            showSuccessToast("Profile updated successfully");
          }
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        16.verticalSpace,
                        CustomTextField(
                          controller: nameController,
                          hintText: "Name",
                        ),
                        8.verticalSpace,
                        CustomTextField(
                          controller: preferencesController,
                          hintText: "Preferences",
                        ),
                        8.verticalSpace,
                        CustomTextField(
                          controller: allergiesController,
                          hintText: "Allergies",
                        ),
                        8.verticalSpace,
                        CustomTextField(
                          controller: dietaryRestrictionsController,
                          hintText: "Dietary Restrictions",
                        ),
                        8.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                context.read<ProfileCubit>().updateProfile(
                      name: nameController.text,
                      preferences: preferencesController.text.split(","),
                      allergies: allergiesController.text.split(","),
                      dietaryRestrictions:
                          dietaryRestrictionsController.text.split(","),
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                fixedSize: const Size(double.maxFinite, 50),
                elevation: 0,
              ),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
