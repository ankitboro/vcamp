import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vcamp/blocs/profile_cubit/profile_cubit.dart';
import 'package:vcamp/core/constants/app_colors.dart';
import 'package:vcamp/core/helpers/app_helpers.dart';
import 'package:vcamp/core/helpers/service_locator.dart';
import 'package:vcamp/widgets/cached_image_widget.dart';

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
        title: const Text(
          "Profile",
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final response = await getConfirmationDialog(
                title: "Do you want to log out ?",
              );
              if (response) logout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
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
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit, color: Colors.white),
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
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
