import 'package:cookeat/config/theme/app_colors.dart';
import 'package:cookeat/core/router/app_router.dart';
import 'package:cookeat/core/router/routes.dart';
import 'package:cookeat/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future<dynamic>.delayed(const Duration(milliseconds: 2500));
      await AppRouter.navigatorKey.currentState?.pushNamed(Routes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            RepaintBoundary(
              child: Animate(
                effects: const [
                  FadeEffect(
                    delay: Duration(milliseconds: 400),
                    duration: Duration(seconds: 1),
                  ),
                  ScaleEffect(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    delay: Duration(milliseconds: 400),
                    duration: Duration(milliseconds: 1500),
                  ),
                ],
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            RepaintBoundary(
              child: Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(seconds: 1),
                  ),
                  ScaleEffect(
                    curve: Curves.fastEaseInToSlowEaseOut,
                    duration: Duration(milliseconds: 1500),
                  ),
                ],
                child: Transform.scale(
                  scale: 3,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.6),
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            RepaintBoundary(
              child: Animate(
                effects: const [
                  ScaleEffect(
                    curve: Curves.elasticOut,
                    delay: Duration(seconds: 1),
                    duration: Duration(milliseconds: 1500),
                  ),
                ],
                child: SvgPicture.asset(
                  '${Constants.vectorsPath}app-logo.svg',
                  width: 160,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
