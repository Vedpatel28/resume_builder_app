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
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Personal Details",
                style: GoogleFonts.jetBrainsMono(),
              ),
              SizedBox(height: s.height * 0.01),
              const Divider(),
              SizedBox(height: s.height * 0.01),
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
                  fillColor: Colors.grey.shade700,
                  prefixIcon: const Icon(Icons.person),
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
