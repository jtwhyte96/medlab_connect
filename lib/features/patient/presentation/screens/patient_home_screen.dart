import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Patient home — root screen for the patient shell route.
class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Patient Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Patient home — coming soon'),
      ),
    );
  }
}
