import 'dart:developer';
import 'dart:io';
import 'package:arapface1/core/setup_service_locator.dart';
import 'package:arapface1/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:arapface1/features/home/data/repos_imple/home_repos_imple.dart';
import 'package:arapface1/features/home/domain/usecases/add_post_usecase.dart';
import 'package:arapface1/features/home/presentation/cubits/add_post_cubit/add_post_cubit.dart';
import 'package:arapface1/features/home/presentation/cubits/get_posts_cubit/get_posts_cubit.dart';
import 'package:arapface1/features/home/presentation/views/widgets/custom_text_form_field.dart';
import 'package:arapface1/features/user/domain/entities/user_posts_entity.dart';
import 'package:arapface1/features/user/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ModalSheetBody extends StatefulWidget {
  const ModalSheetBody({
    super.key,
  });

  @override
  State<ModalSheetBody> createState() => _ModalSheetBodyState();
}

class _ModalSheetBodyState extends State<ModalSheetBody> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      log('image selected correctttttttttttttttttt');
    } else {
      log('No image selected.');
    }
  }

//******************************************************************************* */
  String? imageUrl;
  bool isLoading = false;
  final storageRef =
      FirebaseStorage.instance.ref(); // Firebase Storage reference
  // Upload image to Firebase Storage
  Future<void> uploadImageToFirebase() async {
    isLoading = true;
    setState(() {});
    if (_image == null) return; // Return if no image is selected

    // Create a unique file name

    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      // Upload the image to Firebase Storage
      UploadTask uploadTask = storageRef.child(fileName).putFile(_image!);

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

  GlobalKey<FormState> formkey = GlobalKey();
  String? postcontent;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController postController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    postController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: postController,
              autovalidateMode: autovalidateMode,
              onSaved: (p0) {
                postcontent = p0!;
              },
              onPressedSufixIcon: () {
                pickImageFromGallery();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocProvider(
              create: (context) => AddPostCubit(
                  AddPostUsecase(homeRepos: getIt.get<HomeReposImple>())),
              child: BlocBuilder<AddPostCubit, AddPostState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is AddPostLoading
                        ? true
                        : false || isLoading
                            ? true
                            : false,
                    buttonName: 'Post',
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        await uploadImageToFirebase();
                        BlocProvider.of<AddPostCubit>(context).addPost(
                          postEntity: UserPostEntity(
                            postContent: postcontent!,
                            comments: [],
                            id: FirebaseAuth.instance.currentUser!.uid,
                            time: DateTime.now().toString(),
                            userImage:
                                BlocProvider.of<GetUserInfoCubit>(context)
                                    .userEntitiy!
                                    .userImage,
                            userName: BlocProvider.of<GetUserInfoCubit>(context)
                                .userEntitiy!
                                .userName,
                            postImage: imageUrl!,
                            docummentId: '',
                            likes: [],
                          ),
                        );
                        await BlocProvider.of<GetPostsCubit>(context)
                            .getPosts();
                        postController.clear();
                        autovalidateMode = AutovalidateMode.disabled;

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('Your Post is done...')));
                        // print(postcontent);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
