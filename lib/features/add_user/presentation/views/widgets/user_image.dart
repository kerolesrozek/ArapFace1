// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UserImage extends StatefulWidget {
//   const UserImage({
//     super.key,
//   });

//   @override
//   State<UserImage> createState() => _UserImageState();
// }

// class _UserImageState extends State<UserImage> {
//   final ImagePicker _picker = ImagePicker();
//   File? _image;

//   Future<void> pickImageFromGallery() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     } else {
//       log('No image selected.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _image != null
//         ? CircleAvatar(
//             radius: 84,
//             child: CircleAvatar(
//               backgroundImage: FileImage(_image!),
//               child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 16.0),
//                   child: IconButton(
//                       onPressed: () async {
//                         pickImageFromGallery();
//                       },
//                       icon: Icon(
//                         Icons.add_photo_alternate,
//                         color: Colors.white,
//                       )),
//                 ),
//               ),
//               radius: 80,
//             ),
//           )
//         : CircleAvatar(
//             radius: 82,
//             child: CircleAvatar(
//               backgroundColor: Colors.grey,
//               child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 16.0),
//                   child: IconButton(
//                       onPressed: () async {
//                         pickImageFromGallery();
//                       },
//                       icon: Icon(
//                         Icons.add_photo_alternate,
//                         color: Colors.white,
//                       )),
//                 ),
//               ),
//               radius: 80,
//             ));
//   }
// }
