// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/controller/date_picker_controller.dart';
import 'package:resume_builder_app/model/variable_model.dart';

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
        backgroundColor: Colors.redAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Consumer<DatePickerController>(
            builder: (context, provider, _) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Personal Details",
                      style: GoogleFonts.jetBrainsMono(),
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
                    TextField(
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
                    ),
                    SizedBox(height: s.height * 0.02),
                    Text(
                      "Personal Details",
                      style: GoogleFonts.jetBrainsMono(),
                    ),
                    const Divider(),
                    SizedBox(height: s.height * 0.01),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
