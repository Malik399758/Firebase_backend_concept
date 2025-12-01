import 'dart:ffi';

import 'package:firebase_concept/src/components/app_text_style.dart';
import 'package:firebase_concept/src/components/widgets/black_text.dart';
import 'package:firebase_concept/src/components/widgets/custom_orange_button.dart';
import 'package:firebase_concept/src/components/widgets/custom_text_field.dart';
import 'package:firebase_concept/src/services/auth_service.dart';
import 'package:firebase_concept/src/services/firebase_store_service.dart';
import 'package:firebase_concept/src/views/screens/home_module/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseStoreService firebaseStoreService = FirebaseStoreService();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  bool isLoading = false;

  void _handleProfile()async{
    setState(() {
      isLoading = true;
    });
    final result = await firebaseStoreService.createProfile(firstName: firstNameController.text, lastName: lastNameController.text);

    if(result == null){
      Get.snackbar('Success', 'Profile Created Successfully',backgroundColor: Colors.green,colorText: Colors.white);
      Get.to(() => HomeScreen());
      setState(() {
        isLoading = false;
      });
    }else{
      Get.snackbar('Error', result ?? 'Error occurred',backgroundColor: Colors.red,colorText: Colors.white);
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlackText(txt: 'Profile'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First Name',
                style: AppTextStyle.poppins(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextField(hintText: 'Enter name',controller: firstNameController,),
              SizedBox(height: 20),
              Text(
                'Last Name',
                style: AppTextStyle.poppins(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              CustomTextField(hintText: 'Enter name',controller: lastNameController,),
              SizedBox(height: 20),
              CustomOrangeButton(txt: isLoading ? 'Loading...' : 'Save',onTap: _handleProfile,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
