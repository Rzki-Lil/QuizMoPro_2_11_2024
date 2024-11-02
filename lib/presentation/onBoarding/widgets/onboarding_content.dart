import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/core.dart';
import '../models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final void Function(int index) onPageChanged;
  final List<OnboardingModel> contents;
  final PageController controller;

  const OnboardingContent({
    super.key,
    required this.onPageChanged,
    required this.contents,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        onPageChanged: onPageChanged,
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 800),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: SvgPicture.asset(
                      contents[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FadeInRight(
                        duration: const Duration(milliseconds: 800),
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          contents[index].title,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).textScaler.scale(20),
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w900,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeInLeft(
                        duration: const Duration(milliseconds: 800),
                        delay: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            contents[index].desc,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).textScaler.scale(14),
                              color: AppColors.textColor.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
