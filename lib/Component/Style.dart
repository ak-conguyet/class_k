import 'package:flutter/material.dart';

ButtonStyle CustomButtonStyle() => ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(15))
  )
);