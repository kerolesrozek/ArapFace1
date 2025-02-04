import 'package:flutter/material.dart';

class CommentCusttomTextField extends StatelessWidget {
  const CommentCusttomTextField({
    super.key,
    this.onSaved,
    this.controller,
    this.suffixIcon,
    required this.isLoading,
    this.autovalidateMode,
  });
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isLoading;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this field required';
        }
        return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        hintText: 'comment',
        labelText: 'comment',
        suffixIcon:
            isLoading == false ? suffixIcon : const CircularProgressIndicator(),
      ),
    );
  }
}
