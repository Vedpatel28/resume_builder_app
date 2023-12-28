import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResumePreviewPage extends StatelessWidget {
  const ResumePreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Resume",
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: s.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.redAccent.shade400,
      ),

    );
  }
}
