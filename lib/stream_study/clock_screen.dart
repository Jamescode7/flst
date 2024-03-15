import 'package:flutter/material.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clock')),
      body: Center(
        child: StreamBuilder(
          stream: Stream.periodic(
            const Duration(seconds: 1),
            (computation) => DateTime.now(),
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              DateTime? currentTime = snapshot.data;
              return Text(
                '${currentTime?.hour}:${currentTime?.minute}:${currentTime?.second}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
