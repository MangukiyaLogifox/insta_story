/// Copyright (c) Microsoft Corporation.
/// Licensed under the MIT License.

// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:dual_screen/dual_screen.dart';

class DualScreen extends StatefulWidget {
  @override
  _DualScreenState createState() => _DualScreenState();
}

class _DualScreenState extends State<DualScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TwoPane(
        startPane: Scaffold(
          appBar: AppBar(
            title: const Text('Hinge Angle Sensor'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<bool>(
                  future: DualScreenInfo.hasHingeAngleSensor,
                  builder: (context, hasHingeAngleSensor) {
                    return Text(
                        'Hinge angle sensor exists: ${hasHingeAngleSensor.data}');
                  },
                ),
                StreamBuilder<double>(
                  stream: DualScreenInfo.hingeAngleEvents,
                  builder: (context, hingeAngle) {
                    return Text(
                        'Hinge angle is: ${hingeAngle.data?.toStringAsFixed(2)}');
                  },
                ),
              ],
            ),
          ),
        ),
        endPane: const Material(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text('This pane is visible on dual-screen devices.'),
            ),
          ),
        ),
        panePriority: TwoPanePriority.start,
      ),
    );
  }
}
