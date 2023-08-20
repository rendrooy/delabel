import 'package:flutter/material.dart';

import '../config/constants.dart';

class PrimaryButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPress;
  final double? height;
  final FontWeight? fontWeight;
  final Widget text;
  final IconData? icon;

  const PrimaryButton({
    Key? key,
    this.color,
    this.height,
    this.fontWeight,
    required this.text,
    this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      height: height,
      minWidth: double.infinity,
      disabledColor: kInactiveColor,
      color: color ?? secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: kDefaultPadding * 0.5),
              ],
            ),
          text
        ],
      ),
    );
  }
}
