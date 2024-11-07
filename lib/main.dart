import 'package:call_demo/home_page.dart';
import 'package:flutter/material.dart';
import 'package:zego_express_engine/zego_express_engine.dart';

import 'constants.dart';

void main() {
  createEngine();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
Future<void> createEngine() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get your AppID and AppSign from ZEGOCLOUD Console
  //[My Projects -> AppID] : https://console.zegocloud.com/project
  await ZegoExpressEngine.createEngineWithProfile(ZegoEngineProfile(
    appId,
    ZegoScenario.Default,
    appSign: appSign,
  ));
}