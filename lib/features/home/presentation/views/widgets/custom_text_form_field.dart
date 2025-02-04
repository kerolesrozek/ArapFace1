import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.autovalidateMode,
      this.onSaved,
      this.onPressedSufixIcon,
      this.controller});
  final AutovalidateMode? autovalidateMode;
  final Function(String?)? onSaved;
  final Function()? onPressedSufixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: autovalidateMode,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this field is required';
        }
      },
      onSaved: onSaved,
      maxLines: 6,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          hintText: 'Write Your Post....?',
          suffixIcon: IconButton(
              onPressed: onPressedSufixIcon,
              icon: const Icon(
                Icons.add_photo_alternate,
                size: 35,
              ))),
    );
  }
}
