import 'dart:developer';
import 'dart:io';

import 'package:arapface1/core/app_routes.dart';
import 'package:arapface1/features/add_user/presentation/cubits/add_user_cubit/add_user_cubit.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_textfield.dart';
import 'package:arapface1/features/user/domain/entities/user_entitiy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key, required this.image});
  final File? image;

  @override
  State<AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();

  TextEditingController bioController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
  late String name;
  String? bio;
  String? imageUrl;
  final storageRef =
      FirebaseStorage.instance.ref(); // Firebase Storage reference
  // Upload image to Firebase Storage
  Future<void> uploadImageToFirebase() async {
    isLoading = true;
    setState(() {});
    if (widget.image == null) return; // Return if no image is selected

    // Create a unique file name

    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageRef.child(fileName).putFile(widget.image!);

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Save the download URL in Firestore

      setState(() {
        imageUrl = downloadUrl; // Store the image URL to display it later
        isLoading = false;
      });

      log('Image uploaded and URL saved: $downloadUrl');
    } catch (e) {
      log('Error uploading image: $e');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          CustomTextFormField(
            onSaved: (p0) => name = p0!,
            controller: nameController,
            hint: 'Name',
            lapel: 'Name',
            obscureText: false,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: bioController,
            onSaved: (newValue) {
              bio = newValue;
            },
            decoration: InputDecoration(
              hintText: 'Bio',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              labelText: 'Bio..',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocConsumer<AddUserCubit, AddUserState>(
            listener: (context, state) {

              if (state is AddUserSuccess) {
                GoRouter.of(context).push(AppRoutes.kAppViews,
                    extra: UserEntitiy(
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        userImage: imageUrl!,
                        userName: name, bio: bio, ));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Successsssss',
                    ),
                  ),
                );
              }
              if (state is AddUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errorMessage,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading:
                    state is AddUserLoading ? true : false || isLoading == true,
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    await uploadImageToFirebase();
                    BlocProvider.of<AddUserCubit>(context).addUser(
                      userentity: UserEntitiy(
                          userId: FirebaseAuth.instance.currentUser!.uid,
                          userImage: imageUrl!,
                          userName: name,
                          bio: bio),
                    );
                    nameController.clear();
                    bioController.clear();
                  }
                },
                buttonName: 'Done',
              );
            },
          ),
        ],
      ),
    );
  }
}
