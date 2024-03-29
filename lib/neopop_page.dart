import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insta_story/screens/showcase_screen.dart';
import 'package:insta_story/utils/constants.dart';
import 'package:insta_story/widgets/pop_screen_wrapper.dart';
import 'package:neopop/neopop.dart';

class PopHomeScreen extends StatelessWidget {
  const PopHomeScreen({Key? key}) : super(key: key);

  Widget _ctaWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: Column(
          children: [
            _HomeScreenCta(
              childPath: 'assets/svg/cta_text_main_btn.svg',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PopShowCase(initialIndex: 0),
              )),
            ),
            const SizedBox(height: 15),
            _HomeScreenCta(
              childPath: 'assets/svg/cta_text_primary_btn.svg',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PopShowCase(initialIndex: 1),
              )),
            ),
            const SizedBox(height: 15),
            _HomeScreenCta(
              childPath: 'assets/svg/cta_text_secondary_btn.svg',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PopShowCase(initialIndex: 2),
              )),
            ),
            const SizedBox(height: 15),
            _HomeScreenCta(
              childPath: 'assets/svg/cta_text_advanced.svg',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PopShowCase(initialIndex: 3),
              )),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PopScreenWrapper(
      child: Column(
        children: [
          const Expanded(flex: 4, child: SizedBox()),
          SvgPicture.asset('assets/svg/logo.svg', height: 45),
          const Expanded(flex: 4, child: SizedBox()),
          SvgPicture.asset('assets/svg/neopop_framework_text.svg'),
          const Expanded(flex: 3, child: SizedBox()),
          _ctaWidget(context),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}

class _HomeScreenCta extends StatelessWidget {
  const _HomeScreenCta({Key? key, required this.childPath, required this.onTap})
      : super(key: key);

  final String childPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kSecondaryButtonLightColor,
      parentColor: kSecondaryButtonLightColor,
      depth: kButtonDepth,
      animationDuration: kButtonAnimationDuration,
      buttonPosition: Position.center,
      border: Border.all(color: kBorderColorWhite, width: kButtonBorderWidth),
      onTapUp: () => onTap(),
      onTapDown: () => HapticFeedback.lightImpact(),
      child: SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: SvgPicture.asset(childPath),
        ),
      ),
    );
  }
}
