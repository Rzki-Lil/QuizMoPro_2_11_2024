import 'package:flutter/material.dart';
import 'package:level_3/auth/pages/login.dart';
import 'package:level_3/core/constants/colors.dart';
import 'package:level_3/presentation/onBoarding/widgets/onboarding_content.dart';
import '../../../core/components/buttons.dart'; 
import '../../../presentation/onBoarding/models/onboarding_model.dart';
import 'package:level_3/presentation/home/home.dart';
import 'package:animate_do/animate_do.dart';
import 'package:page_transition/page_transition.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  final onboardingData = [
    OnboardingModel(
      image: 'assets/svg/onBoarding_1.svg',
      title: 'Selamat Datang di Members Space',
      desc: 'Platform digital untuk mengelola keanggotaan komunitas Anda dengan mudah dan efisien',
    ),
    OnboardingModel(
      image: 'assets/svg/onBoarding_2.svg', 
      title: 'Kelola Anggota',
      desc: 'Pantau dan kelola data anggota komunitas Anda dalam satu platform terintegrasi',
    ),
    OnboardingModel(
      image: 'assets/svg/onBoarding_3.svg',
      title: 'Analisis & Laporan',
      desc: 'Dapatkan insight berharga dari data anggota melalui analisis dan laporan yang komprehensif',
    ),
    OnboardingModel(
      image: 'assets/svg/onBoarding_1.svg',
      title: 'Komunikasi Efektif',
      desc: 'Jalin komunikasi yang lebih baik dengan anggota melalui fitur pesan dan notifikasi',
    ),
    OnboardingModel(
      image: 'assets/svg/onBoarding_2.svg',
      title: 'Mulai Sekarang',
      desc: 'Bergabung sekarang dan tingkatkan pengelolaan komunitas Anda ke level berikutnya',
    ),
  ];

  final PageController _pageController = PageController();

  void nextPage() {
    if (currentPage == onboardingData.length - 1) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 800),
          child: const Login(),
        ),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Current Page: $currentPage');
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Muhamad Rijki Ajkia',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'NPM: 065122087',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            FadeInDown(
              duration: const Duration(milliseconds: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/logo/logo_white.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'MEMBERS\nSPACE',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            OnboardingContent(
              contents: onboardingData,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 24 : 12,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index 
                          ? AppColors.primary 
                          : AppColors.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Button.filled(
                    onPressed: nextPage,
                    label: currentPage == onboardingData.length - 1 
                        ? 'Mulai' 
                        : 'Lanjut',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
