import 'package:flutter/material.dart';
import 'package:furnitureapp/constants.dart';
import 'package:furnitureapp/controllers/address_controller.dart';
import 'package:furnitureapp/controllers/card_details_controller.dart';
import 'package:furnitureapp/controllers/cart_controller.dart';
import 'package:furnitureapp/controllers/favorites_controller.dart';
import 'package:furnitureapp/controllers/home_controller.dart';
import 'package:furnitureapp/controllers/user_controller.dart';
import 'package:furnitureapp/screens/authentication/onboarding_welcome.dart';
import 'package:furnitureapp/screens/authentication/splash_screen.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      Get.put(HomeController());
      Get.put(FavoritesController());
      Get.put(CartController());
      Get.put(UserController());
      Get.put(AddressController());
      Get.put(CardDetailsController());
      Get.to(() => SplashScreen(), transition: Transition.fadeIn);
    } else {
      Get.off(() => const OnBoardingWelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(color: kOffBlack)),
    );
  }
}
