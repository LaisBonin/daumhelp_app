import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData handleIconFromFirebase(String iconName) {
    switch (iconName) {
      case "rulerCombined":
        return FontAwesomeIcons.rulerCombined;
      case "squareRootVariable":
        return FontAwesomeIcons.squareRootVariable;
      case "cube":
        return FontAwesomeIcons.cube;
      case "flask":
        return FontAwesomeIcons.flask;
      case "atom":
        return FontAwesomeIcons.atom;
      case "desktop":
        return FontAwesomeIcons.desktop;
      default:
        return FontAwesomeIcons.question;
    }
  }