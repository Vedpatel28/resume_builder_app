import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder_app/model/variable_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filed Details"),
        backgroundColor: Colors.redAccent.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: GoogleFonts.jetBrainsMono(),
              ),
              const Divider(),
              // Name
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Name";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  VariableModal.name.text = newValue!;
                },
                controller: VariableModal.name,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: "Name",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.perm_identity),
                ),
                textInputAction: TextInputAction.next,
              ),
              // Email
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Email";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  VariableModal.email.text = newValue!;
                },
                controller: VariableModal.email,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: "Email",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                textInputAction: TextInputAction.next,
              ),
              // Number
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Number";
                  } else {
                    return null;
                  }
                },
                maxLength: 10,
                onSaved: (newValue) {
                  VariableModal.number.text = newValue!;
                },
                controller: VariableModal.number,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: "Number",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
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
                onSaved: (newValue) {
                  VariableModal.address.text = newValue!;
                },
                controller: VariableModal.address,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: "Address",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.add_location_alt_outlined),
                ),
                textInputAction: TextInputAction.next,
              ),
              // DOB
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter The Valid Date";
                  } else {
                    return null;
                  }
                },
                onSaved: (newValue) {
                  VariableModal.dob.text = newValue!;
                },
                controller: VariableModal.dob,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: const OutlineInputBorder(),
                  labelText: "DOB",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  prefixIcon: const Icon(Icons.date_range),
                ),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
