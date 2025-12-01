
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackText extends StatelessWidget {
  final String txt;
  const BlackText({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600),);
  }
}
