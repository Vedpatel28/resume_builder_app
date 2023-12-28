// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/date_picker_controller.dart';
import 'package:resume_builder_app/model/variable_model.dart';
import 'package:resume_builder_app/utiles/routes_utiles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resume Create",
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: s.height * 0.03,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AllRoutes.previewPage,
              );
            },
            icon: const Icon(
              Icons.document_scanner_outlined,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.redAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: s.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              SizedBox(height: s.height * 0.01),
              // Name
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Name";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.name.text = newValue!;
                },
                controller: VariableModal.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                  prefixIcon: Icon(Icons.perm_identity),
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Email
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Email";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.email.text = newValue!;
                },
                controller: VariableModal.email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Number
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Number";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                maxLength: 10,
                onSaved: (newValue) {
                  VariableModal.number.text = newValue!;
                },
                controller: VariableModal.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Number",
                  prefixIcon: Icon(Icons.phone_android_outlined),
                ),
                keyboardType: TextInputType.number,
              ),
              // Address
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Address";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.address.text = newValue!;
                },
                controller: VariableModal.address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Address",
                  prefixIcon: Icon(Icons.add_location_alt_outlined),
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // DOB
              Consumer<DatePickerController>(builder: (context, provider, _) {
                return TextField(
                  onSubmitted: (value) {
                    VariableModal.dob.text = value;
                  },
                  textInputAction: TextInputAction.next,
                  controller: VariableModal.dob,
                  onTap: () async {
                    provider.date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000),
                    );
                    if (provider.date != null) {
                      provider.setDate();
                      log(" Date : ${provider.date} ");
                    } else {
                      showBottomSheet(
                        context: context,
                        builder: (context) => const SnackBar(
                          content: Text(
                            "Can't Picked Date",
                          ),
                        ),
                      );
                    }
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    border: const OutlineInputBorder(),
                    labelText: "DOB",
                    prefixIcon: IconButton(
                      onPressed: () async {
                        provider.date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(3000),
                        );
                        if (provider.date != null) {
                          provider.setDate();
                          log(" Date : ${provider.date} ");
                        } else {
                          showBottomSheet(
                            context: context,
                            builder: (context) => const SnackBar(
                              content: Text(
                                "Can't Picked Date",
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ),
                );
              }),
              SizedBox(height: s.height * 0.02),
              Text(
                "Job Information",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: s.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              SizedBox(height: s.height * 0.01),
              // Job Title
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Job Title";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.jobTitle.text = newValue!;
                },
                controller: VariableModal.jobTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Job Title",
                  prefixIcon: Icon(Icons.post_add),
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Study
              Row(
                children: [
                  Text(
                    "Study",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: s.height * 0.021,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PopupMenuButton(
                    elevation: 2,
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 35,
                    ),
                    onSelected: (value) {
                      if (value == '10th') {
                        VariableModal.study.text = '10th';
                      }
                      if (value == '12th') {
                        VariableModal.study.text = '12th';
                      }
                      if (value == 'college') {
                        VariableModal.study.text = 'Bachelor Complete';
                      }
                      if (value == 'collegeMaster') {
                        VariableModal.study.text = 'Master Complete';
                      }
                    },
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          value: '10th',
                          child: Text(" SSC (10th)"),
                        ),
                        const PopupMenuItem(
                          value: '12th',
                          child: Text(" HSC (12th)"),
                        ),
                        const PopupMenuItem(
                          value: 'college',
                          child: Text(" college (Bachelor completed)"),
                        ),
                        const PopupMenuItem(
                          value: 'collegeMaster',
                          child: Text(" college (Master completed)"),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              SizedBox(height: s.height * 0.02),
              // Experience
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Experience Year";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.experience.text = newValue!;
                },
                controller: VariableModal.experience,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Experience",
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Skill
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Skill";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.skill.text = newValue!;
                },
                controller: VariableModal.skill,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Skill",
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Project
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Project";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.project.text = newValue!;
                },
                controller: VariableModal.project,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Project",
                ),
              ),
              SizedBox(height: s.height * 0.02),
              // Nationality
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Nationality";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  VariableModal.nationality.text = newValue!;
                },
                controller: VariableModal.nationality,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nationality",
                ),
              ),
              SizedBox(height: s.height * 0.04),
              CupertinoButton.filled(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Resume Successful Created"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Can't Created Resume"),
                      ),
                    );
                  }
                },
                child: const Text("Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
