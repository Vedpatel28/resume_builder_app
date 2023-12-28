import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder_app/model/variable_model.dart';

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
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(3, 2),
                color: Colors.black26,
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(
                      VariableModal.jobTitle.text,
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Name : ${VariableModal.name.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "email : ${VariableModal.email.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Number : ${VariableModal.number.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "DOB : ${VariableModal.dob.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Experience : ${VariableModal.experience.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Skill : ${VariableModal.skill.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Nationality : ${VariableModal.nationality.text}",
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: s.height * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
