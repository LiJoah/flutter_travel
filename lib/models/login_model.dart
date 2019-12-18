class LoginModel {
  String token;
  bool wechatSingle;
  int nowTime;
  Cookies cookies;

  LoginModel(this.token, this.wechatSingle, this.nowTime, this.cookies);

  factory LoginModel.fromMap(Map<String, dynamic> data) {
    String _token = data["token"] as String ?? "";
    bool _wechatSingle = data["wechatSingle"] as bool ?? false;
    int _nowTime = data["nowTime"] as int ?? 0;
    var _cookies = data["cookies"];
    Cookies c;
    if (_cookies != null) {
      c = Cookies.fromMap(_cookies);
    }
    return LoginModel(_token, _wechatSingle, _nowTime, c);
  }
}

class Cookies {
  final String i;
  final String qunarGobal;
  final String csrfToken;
  final String q;
  final String s;
  final String t;
  final String v;

  Cookies(
      this.i, this.qunarGobal, this.q, this.csrfToken, this.s, this.t, this.v);

  factory Cookies.fromMap(json) {
    String _i = json["_i"] as String;
    String qunarGobal = json["QunarGobal"] as String;
    String csrfToken = json["csrfToken"] as String;
    String _q = json["_q"] as String;
    String _s = json["_s"] as String;
    String _t = json["_t"] as String;
    String _v = json["_v"] as String;
    return Cookies(_i, qunarGobal, _q, csrfToken, _s, _t, _v);
  }
}

class AccountInfo {
  final String imgUrl;
  final String nickname;
  final String markMobile;
  final bool isBind;

  AccountInfo(this.imgUrl, this.nickname, this.markMobile, this.isBind);

  factory AccountInfo.fromMap(json) {
    String imgUrl = json["imgUrl"] as String;
    String nickname = json["nickname"] as String;
    String markMobile = json["markMobile"] as String;
    bool isBind = json["isBind"] as bool;
    return AccountInfo(imgUrl, nickname, markMobile, isBind);
  }
}
