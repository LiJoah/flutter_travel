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
