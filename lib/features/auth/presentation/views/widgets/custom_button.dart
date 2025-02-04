import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonName,
    this.isLoading = false,
    this.onTap,
  });
  final String buttonName;
  final bool isLoading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.lightBlue,
        ),
        child: Center(
            child: isLoading == false
                ? Text(
                    buttonName,
                    style: const TextStyle(fontSize: 22),
                  )
                : const CircularProgressIndicator()),
      ),
    );
  }
}
