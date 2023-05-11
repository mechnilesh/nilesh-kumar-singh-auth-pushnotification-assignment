import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';

import '../../widgets/slider_widget.dart';

class IndroductionSliderScreen extends StatelessWidget {
  const IndroductionSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const SliderWidget(),
    );
  }
}
