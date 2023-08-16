import 'package:flutter/material.dart';

import '../config/constants.dart';

// import '../config/constans.dart';

class SecondaryButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPress;
  final Widget text;
  // final double? fontSize;
  // final FontWeight? fontWeight;
  // final String text;
  final IconData? icon;

  const SecondaryButton({
    Key? key,
    this.color,
    this.icon,
    // this.fontSize,
    // this.fontWeight,
    required this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: onPress,
      minWidth: double.infinity,
      height: 45,
      color: Colors.transparent,
      elevation: 0,
      // disabledColor: kInactiveColor,
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
    // MaterialButton(
    //     onPressed: onPress,
    //     minWidth: double.infinity,
    //     disabledColor: kInactiveColor,
    //     color: color ?? Colors.green,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         if (icon != null)
    //           Row(
    //             children: [
    //               Icon(icon, size: 20),
    //               SizedBox(width: kDefaultPadding * 0.5),
    //             ],
    //           ),
    //         text
    //       ],
    //     ));
  }
}
