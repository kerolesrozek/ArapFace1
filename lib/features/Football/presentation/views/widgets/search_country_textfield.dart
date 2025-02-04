// import 'package:flutter/material.dart';

// class CustomTextFormFieldForSeachCountery extends StatelessWidget {
//   const CustomTextFormFieldForSeachCountery({
//     super.key,
//     this.onSubmitted,
//     this.controller,
//     this.autovalidateMode,
//   });

//   final Function(String?)? onSubmitted;
//   final TextEditingController? controller;
//   final AutovalidateMode? autovalidateMode;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       autovalidateMode: autovalidateMode,
//       onFieldSubmitted: onSubmitted,
//       controller: controller,
//       validator: (value) {
//         if (value?.isEmpty ?? true) {
//           return 'this Field is required';
//         }
//       },
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//         hintText: 'Enter just first 3 char of the  Country Name',
//         label: const Text(
//           'Enter just first 3 char of the  Country Name',
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//       ),
//     );
//   }
// }
