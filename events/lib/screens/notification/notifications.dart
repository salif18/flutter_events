import 'package:events/screens/notification/widgets/notifappbar.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotificationAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              
            ),
            )
          ],
        ),
      ),
    );
  }
}