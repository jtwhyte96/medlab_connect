import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Laboratory home — root screen for the laboratory shell route.
class LaboratoryHomeScreen extends StatelessWidget {
  const LaboratoryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Laboratory Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Laboratory home — coming soon'),
      ),
    );
  }
}
