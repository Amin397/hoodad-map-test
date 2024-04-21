import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Controllers/Profile/profile_controller.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
