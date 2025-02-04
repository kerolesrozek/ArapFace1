import 'dart:developer';
import 'dart:io';

import 'package:arapface1/features/add_user/presentation/views/widgets/add_user_form.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddUserViewBody extends StatefulWidget {
  const AddUserViewBody({super.key});

  @override
  State<AddUserViewBody> createState() => _AddUserViewBodyState();
}

class _AddUserViewBodyState extends State<AddUserViewBody> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      log('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .12,
          ),
          CircleAvatar(
            radius: 103,
            backgroundColor: Colors.blue,
            child: _image != null
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: FileImage(_image!),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: IconButton(
                          onPressed: () {
                            pickImageFromGallery();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 100,
                    // backgroundImage: FileImage(_image!),
                    backgroundColor: Colors.grey,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: IconButton(
                          onPressed: () {
                            pickImageFromGallery();
                          },
                          icon: const Icon(
                            Icons.add_a_photo_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
          AddUserForm(
            image: _image,
          )
        ],
      ),
    );
  }
}
