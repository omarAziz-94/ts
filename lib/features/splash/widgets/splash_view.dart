import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/constants/images.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({Key? key}) : super(key: key);

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(0, 3),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutBack,
  ));
  late final Animation<double> _opacityAnimation = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(_controller);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
          position: _offsetAnimation,
          child: FadeTransition(
              opacity: _opacityAnimation,
              child: SvgPicture.asset(Images.schoolBusSVG))),
    );
  }
}
