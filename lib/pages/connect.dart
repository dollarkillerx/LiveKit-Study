import 'package:flutter/material.dart';

import '../widgets/text_field.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final _uriCtrl = "wss://live.mechat.live";
  final _tokenCtrl = TextEditingController();
  bool _simulcast = true;  // 模拟广播
  bool _adaptiveStream = true; // 自适应流
  bool _dynacast = true; // 启用Dynacast，默认为关闭。使用Dynacast可以动态地暂停，暂停没有被任何用户消费的视频层，大大减少了发布CPU和带宽的使用。
  bool _busy = false;
  bool _fastConnect = false; // 快速连接

  Future<void> _connect(BuildContext ctx) async {
    return null;
  }

  void _setSimulcast(bool? value) async {}

  void _setAdaptiveStream(bool? value) async {}

  void _setDynacast(bool? value) async {}

  void _setFastConnect(bool? value) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: LKTextField(
                    label: 'Server URL',
                    ctrl: _uriCtrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: LKTextField(
                    label: 'Token',
                    ctrl: _tokenCtrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Simulcast'),
                      Switch(
                        value: _simulcast,
                        onChanged: (value) => _setSimulcast(value),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Adaptive Stream'),
                      Switch(
                        value: _adaptiveStream,
                        onChanged: (value) => _setAdaptiveStream(value),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Fast Connect'),
                      Switch(
                        value: _fastConnect,
                        onChanged: (value) => _setFastConnect(value),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dynacast'),
                      Switch(
                        value: _dynacast,
                        onChanged: (value) => _setDynacast(value),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _busy ? null : () => _connect(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_busy)
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      const Text('CONNECT'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
