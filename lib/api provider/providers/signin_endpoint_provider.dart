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
      GetStorage prefs = GetStorage();
      print(email);
      print(pass);
      var data = {"userIdentifier": email, "password": pass};
      CommanLoader.loader();
      Response r = await client.post('user/login', data: data);
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
