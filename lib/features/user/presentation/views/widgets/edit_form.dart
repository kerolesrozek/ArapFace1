import 'dart:developer';
import 'dart:io';

import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:arapface1/features/user/data/repos_imple/user_repos_imple.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:arapface1/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:arapface1/features/user/presentation/cubits/edit_cubit/edit_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_posts_cubit/get_user_posts_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditForm extends StatefulWidget {
  const EditForm({super.key, required this.image});
  final File? image;
  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  bool isLoading = false;
  String? imageUrl;

  // Upload image to Firebase Storage

  final storageRef = FirebaseStorage.instance.ref();
  Future<void> uploadImageToFirebase() async {
    isLoading = true;
    setState(() {});
    if (widget.image == null) {
      isLoading = false;
      setState(() {});
    }
    // Return if no image is selected

    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      UploadTask uploadTask = storageRef.child(fileName).putFile(widget.image!);

      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl; // Store the image URL to display it later
        isLoading = false;
      });

      log('Image uploaded and URL saved: $downloadUrl');
    } catch (e) {
      log('Error uploading image: $e');
    }
  }

  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  String? name;
  String? bio;

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserEntitiy userEntitiy = GoRouterState.of(context).extra as UserEntitiy;
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: nameController,
            onSaved: (p0) {
              name = p0;
            },
            hint: 'New Name',
            lapel: 'New Name',
            obscureText: false,
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            controller: bioController,
            onSaved: (p0) {
              bio = p0;
            },
            hint: 'New Bio',
            lapel: 'New Bio',
            obscureText: false,
          ),
          SizedBox(
            height: 20,
          ),
          BlocProvider(
            create: (context) => EditCubit(
                EditProfileUsecase(userRepos: getIt.get<UserReposImple>())),
            child: BlocBuilder<EditCubit, EditState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: EditState is EditLoading || isLoading == true
                      ? true
                      : false,
                  buttonName: 'Edit',
                  onTap: () async {
                    await uploadImageToFirebase();
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      BlocProvider.of<EditCubit>(context).editUserInfo(
                          userEntity: UserEntitiy(
                              userId: userEntitiy.userId,
                              userImage: imageUrl ?? userEntitiy.userImage,
                              userName: name!,
                              bio: bio),
                          docId: userEntitiy.docId!);
                      nameController.clear();
                      bioController.clear();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Edit Sucess")));
                      BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
                      BlocProvider.of<GetUserPostsCubit>(context)
                          .getUserPosts();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
