import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/helpers/app_helpers.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/core/routes/app_routes.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';
import 'package:vcamp/widgets/loader.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final User user = FirebaseAuth.instance.currentUser!;
  @override
  void initState() {
    locator<ProfileCubit>().fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFetchedState) {
            return Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
                      color: AppColors.primaryColor,
                    ),
                    Positioned(
                      bottom: -50,
                      left: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: state.profileModel.data?.dp ?? "",
                        ).withPlaceHolder(),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.updateProfileScreen,
                                arguments: state.profileModel,
                              );
                            },
                            icon: const Icon(Icons.edit, color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () async {
                              final response = await getConfirmationDialog(
                                title: "Do you want to log out ?",
                              );
                              if (response) logout();
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.profileModel.data?.name ?? "N/A",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    2.verticalSpace,
                    Text(
                      state.profileModel.data?.email ?? "",
                    )
                  ],
                ),
                16.verticalSpace,
                if (state.profileModel.data?.preferences != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text("Preferences:"),
                        SizedBox(width: 12),
                        ...state.profileModel.data!.preferences!
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Chip(
                                    label: Text(e),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                8.verticalSpace,
                if (state.profileModel.data?.allergies != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text("Allergies"),
                        SizedBox(width: 12),
                        ...state.profileModel.data!.allergies!
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(
                                    label: Text(e),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
                8.verticalSpace,
                if (state.profileModel.data?.dietaryRestrictions != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Text("Dietary Restrictions"),
                        SizedBox(width: 12),
                        ...state.profileModel.data!.dietaryRestrictions!
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Chip(
                                    label: Text(e),
                                  ),
                                ))
                            .toList(),
                      ],
                    ),
                  ),
              ],
            );
          } else if (state is ProfileFetchErrorState) {
            return Center(
              child: Text(
                state.failure.message!,
              ),
            );
          }
          return const Center(
            child: Loader(),
          );
        },
      ),
    );
  }
}
