import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Admin home — root screen for the admin shell route.
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: const Center(
        child: Text('Admin home — coming soon'),
      ),
    );
  }
}
