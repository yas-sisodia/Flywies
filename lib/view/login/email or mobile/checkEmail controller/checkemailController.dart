import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/login/email%20or%20mobile/checkEmail%20controller/verify%20email/verify_email.dart';

class CheckEmailController extends GetxController {
  GlobalKey<FormState> checkEmailkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  String ? emailValidator(value){
    if (value == '') {
      return 'Please enter your emailid/Phone Number';
    } else {
      return null;
    }
  }

  void checkEmail(){
    final validator = checkEmailkey.currentState!.validate();

    if (!validator) {
      return;
    } else {
      Get.to(()=> VerifyEmail());
    }
  }

}