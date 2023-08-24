import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/widgets/constant.dart';

class SignInProvider {
  Dio client;
  SignInProvider({required this.client});
  signinApi(var email, var pass) async {
    try {
//       var headers = {
//   'Content-Type': 'application/json'
// };
// var data = json.encode({
//   "email": "yash@gmail.com",
//   "password": "@Yash1234",
//   "otp": "738972"
// });
// var dio = Dio();
// var response = await dio.request(
//   'http://13.233.114.64:8000/login',
      // options: Options(
      //   method: 'POST',
      //   headers: headers,
      // ),
//   data: data,
// );

// if (response.statusCode == 200) {
//   print(json.encode(response.data));
// }
// else {
//   print(response.statusMessage);
// }

      var headers = {'Content-Type': 'application/json'};
      GetStorage prefs = GetStorage();
      print(email);
      print(pass);
      var data = {"email": email, "password": pass, "otp": "738972"};
      CommanLoader.loader();
      // Response r = await client.post('user/login', data: data);
      Response r = await client.request('http://13.233.114.64:8000/login',
          options: Options(
            method: 'POST',
            headers: headers,
          ),
          data: data);
      // print(r.statusCode);
      // print(r.data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
        prefs.write('token', r.data['data']['token']);
        token = prefs.read('token');
        print(token);
        CommanLoader.hideLoader();
        g.Get.offAll(() => BottomNavBarscreen());
      } else {
        CommanLoader.hideLoader();
        CommanLoader.message("wrong credentials");
      }
    } on DioError catch (e) {
      print(e.toString());
      CommanLoader.hideLoader();
      CommanLoader.message(e.response!.data['msg']);
    }
  }
}
