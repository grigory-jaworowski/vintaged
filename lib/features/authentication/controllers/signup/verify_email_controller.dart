import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vintaged/common/widgets/success_screen/success_screen.dart';
import 'package:vintaged/data/repositories/authentication/authentication_repository.dart';
import 'package:vintaged/utils/constants/image_strings.dart';
import 'package:vintaged/utils/constants/text_strings.dart';
import 'package:vintaged/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //Send email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //Send email verification link
  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      VLoaders.successSnackBar(title: 'Email Sent', message: 'Please check inbox and verify your email.');

    } catch (e) {
      VLoaders.errorSnackBar(title: 'Unexpected error!', message: e.toString());
    }
  }
  
  //Timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: VImages.successfulAnimation,
            title: VTexts.yourAccountCreatedTitle,
            subtitle: VTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect()
          )
        );
      }
    });
  }

  //Manually check if email verified
  checkEmailVerificationStatus() async {
    final current = FirebaseAuth.instance.currentUser;
    if (current != null && current.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: VImages.successfulAnimation,
          title: VTexts.yourAccountCreatedTitle,
          subtitle: VTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect()
        )
      );
    }
  }
}