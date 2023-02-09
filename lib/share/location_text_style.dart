import 'package:flutter/material.dart';
import 'package:flutter_repo/share/location_style.dart';
import 'package:google_fonts/google_fonts.dart';


class LocationTextStyle {
  static final baseTextStyle = GoogleFonts.getFont('Raleway')
                                  .copyWith(color: LocationStyle.colorPurple);
  static final regularTextStyle = baseTextStyle.copyWith(
    fontSize: 13
  );

  static final regularWhiteTextStyle = baseTextStyle.copyWith(
    color: Colors.white70,
    fontSize: 13
  );
  static final boldTextStyle = baseTextStyle.copyWith(
    fontWeight: FontWeight.bold
  );

}