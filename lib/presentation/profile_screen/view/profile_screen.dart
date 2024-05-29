import 'dart:io';

import 'package:clean_code_demo/presentation/profile_screen/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
  File? image;

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    Provider.of<ProfileController>(context, listen: false).getReceivedData();
    super.initState();
  }

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
      body: Consumer<ProfileController>(builder: (context, controller, _) {
        firstNameController.text = controller.getData["data"]["user"]["fname"] ?? "";
        lastNameController.text = controller.getData["data"]["user"]["lname"] ?? "";
        phoneController.text = controller.getData["data"]["user"]["mobile"] ?? "";
        addressController.text = controller.getData["data"]["user"]["address"] ?? "";
        detailsController.text = controller.getData["data"]["user"]["detail"] ?? "";
        return controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
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
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                              image: image != null
                                  ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
                                  : DecorationImage(image: AssetImage("asset/dp.png"))),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Choose the Source"),
                                      actions: [
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              getImage(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.camera,
                                              color: const Color(0xffFF9900),
                                            ),
                                            label: Text("Camera", style: TextStyle(color: Colors.black))),
                                        ElevatedButton.icon(
                                            onPressed: () {
                                              getImage(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.photo,
                                              color: const Color(0xffFF9900),
                                            ),
                                            label: Text("Gallery", style: TextStyle(color: Colors.black)))
                                      ],
                                    );
                                  });
                            },
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: const Color(0xffFF9900),
                              child: Center(
                                child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.width * .1),
                      TextFormFieldWidget(
                        size: size,
                        textEditingController: firstNameController,
                        label: 'First Name',
                        filled: false,
                      ),
                      SizedBox(height: size.width * .03),
                      TextFormFieldWidget(
                        size: size,
                        textEditingController: lastNameController,
                        label: 'Last Name',
                        filled: false,
                      ),
                      SizedBox(height: size.width * .03),
                      TextFormFieldWidget(
                        size: size,
                        textEditingController: phoneController,
                        label: 'Mobile Number',
                        filled: false,
                      ),
                      SizedBox(height: size.width * .03),
                      TextFormFieldWidget(size: size, label: 'Password', filled: false),
                      SizedBox(height: size.width * .03),
                      TextFormFieldWidget(
                        size: size,
                        textEditingController: addressController,
                        label: 'Address',
                        filled: false,
                      ),
                      SizedBox(height: size.width * .03),
                      TextFormFieldWidget(
                        size: size,
                        textEditingController: detailsController,
                        label: 'Details',
                        filled: false,
                        maxLines: 4,
                      ),
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
              );
      }),
    );
  }
}
