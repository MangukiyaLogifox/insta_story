// ignore_for_file: unused_local_variable, use_full_hex_values_for_flutter_colors, unnecessary_this

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen> {
  final controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.red;
    return Scaffold(
      backgroundColor: const Color(0xFF0000F),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ConfettiWidget(
            blastDirectionality: BlastDirectionality.explosive,
            confettiController: controller,
            shouldLoop: true,
            // blastDirection: BlastDirectionality.explosive,
            numberOfParticles: 30,
            emissionFrequency: 0.40,
            createParticlePath: (size) {
              final path = Path();
              path.addOval(Rect.fromCircle(center: Offset.zero, radius: 10));
              return path;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170.0, top: 300.0),
            child: ElevatedButton(
                onPressed: () {
                  if (isPlaying) {
                    controller.stop();
                  } else {
                    controller.play();
                  }
                },
                child: Text(isPlaying ? 'Stop' : 'Celebrate')),
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           if (isPlaying) {
          //             controller.stop();
          //           } else {
          //             controller.play();
          //           }
          //         },
          //         child: Text(isPlaying ? 'Stop' : 'Celebrate')),
          //     // Load a Lottie file from your assets
          //     Lottie.asset('assets/Lottie Lego.json', height: 230, width: 230),
          //     // Load a Lottie file from a remote url
          //     Lottie.network(
          //         'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
          //         height: 230,
          //         width: 230),
          //     // Load an animation and its images from a zip file
          //     Lottie.asset('assets/Polite Chicky.json',
          //         height: 230, width: 230),
          //     Center(
          //       child: Listener(
          //         onPointerDown: (_) => setState(() {
          //           ispressed = true;
          //         }),
          //         onPointerUp: (_) => setState(() {
          //           ispressed = false;
          //         }),
          //         child: TextButton(
          //           onHover: (hovered) => setState(() {
          //             this.ispressed = hovered;
          //           }),
          //           style: TextButton.styleFrom(
          //               side: const BorderSide(
          //                 color: Colors.white,
          //                 width: 4,
          //               ),
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(10))),
          //           onPressed: () {},
          //           child: Text(
          //             "Neon Button",
          //             style: TextStyle(color: Colors.white, shadows: [
          //               for (double i = 1; i < 4; i++)
          //                 Shadow(
          //                   color: shadowColor,
          //                   blurRadius: 3 * i,
          //                 )
          //             ]),
          //           ),
          //         ),
          //       ),
          //     ),

          //   ],
          // ),
        ],
      ),
    );
  }
}
