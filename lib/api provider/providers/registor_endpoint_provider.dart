import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/view/signUp/verify/verify.dart';
import 'package:raghu_education/widgets/commonLoader.dart';

class RegisterEndPoint {
  Dio client;
  RegisterEndPoint({required this.client});

  RegisterApi(var emailOrMobile, var password, var confirm) async {
    try {
      CommanLoader.loader();
      var data = json.encode({
        "email": emailOrMobile,
        // "mobileNumber": "8449193291",
        "password": password,
        "confirmPassword": confirm
      });

      Response r =
          await client.post('http://13.233.114.64:8000/signup', data: data);
      print(r.statusCode);
      print(r.data);
      CommanLoader.hideLoader();
      // if (r.statusMessage == "Signup successful") {
      if (r.statusCode == 201) {
        print("Inside status code");
        // print(r.);
        // g.Get.to(() => VerifyScreen());
        g.Get.offAll(() => VerifyScreen());
      } else {
        print("Inside else");
        CommanLoader.message(r.data['msg']);
      }
    } on DioError catch (err) {
      CommanLoader.hideLoader();
      CommanLoader.message(err.response!.data['msg']);
    }
  }
}
