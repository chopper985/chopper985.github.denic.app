import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthenFacebook {
  static Future loginWithFacebook({required BuildContext context}) async {
    final _auth = FirebaseAuth.instance;
    final _facebooklogin = FacebookLogin();
    // Gọi hàm LogIn() với giá trị truyền vào là một mảng permission
    // Ở đây mình truyền vào cho nó quền xem email
    final result = await _facebooklogin.logIn(['email']);
    // Kiểm tra nếu login thành công thì thực hiện login Firebase
    // (theo mình thì cách này đơn giản hơn là dùng đường dẫn
    // hơn nữa cũng đồng bộ với hệ sinh thái Firebase, tích hợp được
    // nhiều loại Auth
    print(result.status);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential =
          FacebookAuthProvider.credential(result.accessToken.token);
      // Lấy thông tin User qua credential có giá trị token đã đăng nhập
      final user = (await _auth.signInWithCredential(credential)).user;
      return user;
    }
  }
}
