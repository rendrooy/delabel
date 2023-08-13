import '../config/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DefText {
  final String text;
  final Color color;
  final double opacity;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Key? key;

  DefText(this.text,
      {this.maxLine,
      this.color = kFontColor,
      this.opacity = 1,
      this.fontStyle,
      this.fontWeight,
      this.textAlign,
      this.decoration,
      this.key});

  TextStyle get _style {
    return kDefaultTextStyle.copyWith(
      color: color.withOpacity(opacity),
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }

  Text get extraSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 9.7),
    );
  }

  Text get small {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 10.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semiSmall {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 11.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get normal {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 12.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get semiLarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 15.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get large {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 17.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }

  Text get extraLarge {
    return Text(
      text,
      key: key,
      maxLines: maxLine,
      textAlign: textAlign,
      style: _style.copyWith(fontSize: 22.7),
      overflow: maxLine != null ? TextOverflow.ellipsis : null,
    );
  }
}

// class DefTextRenderer extends StatelessWidget {
//   const DefTextRenderer({
//     Key? key,
//     required this.text,
//   }) : super(key: key);

//   final Text text;

//   @override
//   Widget build(BuildContext context) {
//     return TextRenderer(
//       // element: ParagraphElement(),
//       text: text,
//     );
//   }
// }
