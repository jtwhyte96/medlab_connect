import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Doctor home — root screen for the doctor shell route.
class DoctorHomeScreen extends StatelessWidget {
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Doctor Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Doctor home — coming soon'),
      ),
    );
  }
}
