import 'package:flutter/material.dart';

import 'constants.dart';

final theme = const InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: kBgWhite),
  ),

  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: Colors.orange),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: kBgWhite),
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      )),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.red)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(width: 1, color: Colors.red)),
  // hintText: "HintText",
  hintStyle: TextStyle(fontSize: 16, color: kBgWhite),
  labelStyle: TextStyle(fontSize: 16, color: kBgWhite),
  prefixStyle: TextStyle(color: kBgWhite, fontSize: 14),

  // errorText: snapshot.error,
);
