import 'package:boc_app/view/LanguageSelector.dart';
import 'package:flutter/material.dart';
import 'AppLoader.dart';

class FirstTimeConfigurer extends StatefulWidget{
  _ConfigurerView createState() => _ConfigurerView();
}

class _ConfigurerView extends State<FirstTimeConfigurer> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _doAnimation() async {
    try {
      await _controller.forward().then((v) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => LanguageSelector()));
      });
      await _controller.reverse();
    } catch (e) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => LanguageSelector())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _doAnimation();
    return Scaffold(
        body: LoadingAnimation(controller: _controller)
    );
  }
}