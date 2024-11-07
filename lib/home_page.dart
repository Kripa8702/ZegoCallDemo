import 'package:call_demo/call_page.dart';
import 'package:call_demo/call_ui_page.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final roomController = TextEditingController();
  final nameController = TextEditingController();
  final userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  void checkPermission() async {
    final cameraPermission = await Permission.camera.isGranted;
    final microphonePermission = await Permission.microphone.isGranted;

    if (!cameraPermission || !microphonePermission) {
      await Permission.camera.request();
      await Permission.microphone.request();
    }
  }

  void validateAndNavigate(bool isJoining) {
    final roomID = roomController.text;
    final name = nameController.text;
    final userId = userIdController.text;
    // if (roomID.isNotEmpty && name.isNotEmpty) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => CallPage(
    //         roomId: roomID,
    //         name: name,
    //       ),
    //     ),
    //   );
    // }

    if(roomID.isNotEmpty && name.isNotEmpty && userId.isNotEmpty){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallUiPage(
            callID: roomID,
            userId: userId,
            userName: name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zego Flutter Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: roomController,
                decoration: const InputDecoration(
                  labelText: 'Room ID',
                ),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                ),
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: userIdController,
                decoration: const InputDecoration(
                  labelText: 'User ID',
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => validateAndNavigate(true),
                child: const Text('Join Call'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
