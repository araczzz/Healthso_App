import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  PermissionScreenState createState() => PermissionScreenState();
}

class PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      showSnackBar('Location permission granted.');
      _requestMediaPermission();
    } else {
      showSnackBar('Location permission denied.');
    }
  }

  Future<void> _requestMediaPermission() async {
    final status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      showSnackBar('Media permission granted.');
      _requestNotificationPermission();
    } else {
      showSnackBar('Media permission denied.');
    }
  }

  Future<void> _requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isGranted) {
      showSnackBar('Notification permission granted.');
    } else {
      showSnackBar('Notification permission denied.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permission Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _requestLocationPermission,
              child: const Text('Allow app to access your location?'),
            ),
            ElevatedButton(
              onPressed: _requestMediaPermission,
              child: const Text(
                  'Allow app to access photos, media, and files on your device?'),
            ),
            ElevatedButton(
              onPressed: _requestNotificationPermission,
              child: const Text('Allow app to send you notifications?'),
            ),
          ],
        ),
      ),
    );
  }
}
