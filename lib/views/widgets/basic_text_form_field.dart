import 'package:dsw51715/utils/my_images.dart';
import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class BasicTextFormField extends StatelessWidget {
  final String initialValue;
  final String pathToIcon;
  final String? pathToSufIcon; // Nullable path to suffix icon

  const BasicTextFormField({
    required this.pathToIcon,
    this.initialValue = '',
    super.key,
    this.pathToSufIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: ImageIcon(
          AssetImage(pathToIcon), // Icon on the left side
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.borderPurpleColor, // Color of the border
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.borderPurpleColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: pathToSufIcon != null
            ? ImageIcon(AssetImage(pathToSufIcon!))
            : null,
      ),
    );
  }
}
