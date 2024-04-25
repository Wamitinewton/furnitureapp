import 'package:flutter/material.dart';
import 'package:furnitureapp/controllers/address_controller.dart';
import 'package:furnitureapp/controllers/card_details_controller.dart';
import 'package:furnitureapp/controllers/cart_controller.dart';
import 'package:furnitureapp/controllers/favorites_controller.dart';
import 'package:furnitureapp/controllers/home_controller.dart';
import 'package:furnitureapp/controllers/user_controller.dart';
import 'package:furnitureapp/screens/home.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final HomeController _homeController = Get.find();
  final FavoritesController _favoritesController = Get.find();
  final CartController _cartController = Get.find();
  final UserController _userController = Get.find();
  final CardDetailsController _cardDetailsController = Get.find();
  final AddressController _addressController = Get.find();
  Future initControllers() async {
    await _homeController.getProducts(0);
    await _favoritesController.fetchFavorites();
    await _cartController.fetchCartItems();
    await _userController.fetchUserData();
    await _cardDetailsController.getDefaultCardDetail();
    await _addressController.getDefaultShippingAddress();
    Get.off(() => Home());
  }

  @override
  StatelessElement createElement() {
    initControllers();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            LottieBuilder.asset("assets/lottie/splash_loading_animation.json"),
      ),
    );
  }
}
