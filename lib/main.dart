import 'package:flutter/material.dart';
import 'package:livekit_study/pages/connect.dart';
import 'package:livekit_study/theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const LiveKitExampleApp());
}

class LiveKitExampleApp extends StatelessWidget {
  //
  const LiveKitExampleApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'LiveKit',
    debugShowCheckedModeBanner: false,
    theme: LiveKitTheme().buildThemeData(context),
    home: ConnectPage(),
  );
}