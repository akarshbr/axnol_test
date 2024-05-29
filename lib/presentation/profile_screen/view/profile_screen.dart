import 'package:flutter/material.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFF9900),
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.width * .05),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color(0xffFF9900),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * .1),
              TextFormFieldWidget(size: size, label: 'First Name', filled: false),
              SizedBox(height: size.width * .03),
              TextFormFieldWidget(size: size, label: 'Last Name', filled: false),
              SizedBox(height: size.width * .03),
              TextFormFieldWidget(size: size, label: 'Mobile Number', filled: false),
              SizedBox(height: size.width * .03),
              TextFormFieldWidget(size: size, label: 'Password', filled: false),
              SizedBox(height: size.width * .03),
              TextFormFieldWidget(size: size, label: 'Address', filled: false),
              SizedBox(height: size.width * .03),
              TextFormFieldWidget(size: size, label: 'Details', filled: false, maxLines: 4),
              SizedBox(height: size.width * .06),
              ButtonWidget(
                size: size,
                width: .4,
                onTap: () {},
                text: 'Update',
              )
            ],
          ),
        ),
      ),
    );
  }
}
