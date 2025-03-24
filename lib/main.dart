import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'sip_service.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SIPService _sipService = SIPService();
  final TextEditingController _targetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkAndRegisterSIP();
  }

  Future<void> _checkAndRegisterSIP() async {
    if (await _getPermissions()) {
      _sipService.registerSIP(); // Register only if permissions are granted
    } else {
      print('Microphone permission denied. SIP registration skipped.');
    }
  }

  Future<bool> _getPermissions() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      var result = await Permission.microphone.request();
      print('Microphone permission request result: $result');
      return result.isGranted;
    }
    print('Microphone permission already granted.');
    return true;
  }

  @override
  void dispose() {
    _targetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mini VoIP Asterisk')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _targetController,
                decoration: InputDecoration(
                  labelText: 'Numéro SIP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _sipService.makeCall(_targetController.text);
                },
                child: Text('Appeler'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
