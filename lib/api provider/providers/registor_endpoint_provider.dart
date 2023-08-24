import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/view/signUp/verify/verify.dart';
import 'package:raghu_education/widgets/commonLoader.dart';

class RegisterEndPoint{
  Dio client;
  RegisterEndPoint({required this.client});

  RegisterApi(var emailOrMobile , var password, var confirm) async{
    try {
      CommanLoader.loader();
      var data = {
        "userIdentifier": emailOrMobile,
    "password": password,
    "confirmPassword": confirm
      };

      Response r = await client.post('user/signup', data: data);
      print(r.statusCode);
      print(r.data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
      g.Get.to(()=> VerifyScreen());
      } else {
      CommanLoader.message(r.data['msg']);
      }
    } on DioError catch (err) {
      CommanLoader.hideLoader();
      CommanLoader.message(err.response!.data['msg']);
    }

  }
}