import 'package:dio/dio.dart';
import 'package:raghu_education/global_variables.dart';
import 'package:raghu_education/view/signUp/profile/profile_screen.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;

class RegisterVerificationEndPoint {
  Dio client;
  RegisterVerificationEndPoint({required this.client});

  registerVerifyOtp(var email, var otp) async {
    try {
      CommanLoader.loader();
      var data = {"email": email, "otp": otp};
      Response r = await client.post("${GlobalVariables.baseUrl}/verify-otp",
          data: data);
      print(r.statusCode);
      print(r.data);
      CommanLoader.hideLoader();
      if (r.statusCode == 200) {
        g.Get.to(() => ProfileScreen());
      } else {}
    } on DioError catch (e) {
      CommanLoader.hideLoader();
      CommanLoader.message(e.response!.data['msg']);
    }
  }
}
