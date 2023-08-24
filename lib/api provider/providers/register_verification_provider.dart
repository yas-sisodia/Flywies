import 'package:dio/dio.dart';
import 'package:raghu_education/view/signUp/profile/profile_screen.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
class RegisterVerificationEndPoint{
  Dio client;
  RegisterVerificationEndPoint({required this.client});


  registerVerifyOtp(var email, var otp) async{
    try {
      CommanLoader.loader();
      var data = {
            "otp": otp,
    "userIdentifier": email
      };
      Response r = await client.post("user/signup-otp", data: data);
      print(r.statusCode);
      print(r.data);
       CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
          g.Get.to(()=> ProfileScreen());
      } else {
      }
    }on DioError catch (e) {
      CommanLoader.hideLoader();
      CommanLoader.message(e.response!.data['msg']);
    }
  }
}