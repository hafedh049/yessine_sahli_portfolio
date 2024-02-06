import 'package:comment_tree/comment_tree.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../shared/globals.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: oddDarkBgColor,
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * .2,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: EasyStepper(
        activeStep: 0,
        activeStepTextColor: blueColor,
        finishedStepTextColor: whiteColor,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 8,
        showStepBorder: false,
        steps: <EasyStep>[
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 0 ? Colors.orange : Colors.white,
              ),
            ),
            customS: 'Waiting',
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 1 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Order Received',
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 2 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Preparing',
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 3 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'On Way',
            topTitle: true,
          ),
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 4 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'Delivered',
          ),
        ],
        onStepReached: (index) => setState(() => activeStep = index),
      ),
    );
  }
}
