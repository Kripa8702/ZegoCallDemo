import 'package:call_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallUiPage extends StatefulWidget {
  const CallUiPage({super.key, required this.callID, required this.userId, required this.userName});

  final String callID;
  final String userId;
  final String userName;

  @override
  State<CallUiPage> createState() => _CallUiPageState();
}

class _CallUiPageState extends State<CallUiPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ZegoUIKitPrebuiltCall(
        appID: appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: widget.userId,
        userName: widget.userName,
        callID: widget.callID,
        // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    );
  }
}
