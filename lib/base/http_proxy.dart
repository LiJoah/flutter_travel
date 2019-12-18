import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_travel/configs/app_config.dart';
import 'package:flutter_travel/base/utils.dart';
import 'package:flutter_travel/configs/scret_config.dart';
import 'logger_format.dart';

/// http base result
class HttpBaseResult<D> {
  /// code
  String code;

  bool ret;

  /// http msg
  String message;

  /// 放回的数据
  D data;
}

final _dio = Dio(BaseOptions(
  baseUrl: baseUrl,

  /// 连接超时
  // connectTimeout: 5000,

  /// 请求超时
));

initDio() {
  final cookieJar = CookieJar();
  _dio.interceptors.add(CookieManager(cookieJar));
  _dio.interceptors.add(_HttpInterceptors());
}

class _HttpInterceptors extends InterceptorsWrapper {
  @override
  Future onError(DioError err) {
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    var httpCode = response.statusCode;
    if (httpCode == 200) {
      var list = {
        "application/json",
        "application/x-www-form-urlencoded;charset=UTF-8"
      };
      var contentType = response.headers.value("Content-Type");
      var has = false;
      for (var item in list) {
        if (contentType.startsWith(item)) {
          has = true;
        }
      }
      if (has) {
        var rawData = response.data;
        dynamic _d;
        try {
          if (rawData is String) {
            _d = JsonCodec().decode(rawData);
          } else {
            _d = rawData;
          }
          response.data = Utils.camelize(_d);
        } catch (e) {
          logger.error("55: parser rawData error");
        }
      }
    }
    return super.onResponse(response);
  }
}

// apikey=
/// http 请求的中间件
class HttpProxy {
  static final String _host = baseUrl;
  // static String _token;
  // static String _apiKey = "0b2bdeda43b5688921839c8ecb20399b";
  String _method;
  String _path;
  Map<String, Object> _headers = {};
  Map<String, Object> _urlArgs = {};
  Map<String, Object> _bodyArgs = {};

  /// 发送 get 请求
  HttpProxy.get(this._path, this._urlArgs) : assert(_path != null) {
    _method = "GET";
  }

  /// 发送 post 请求
  HttpProxy.post(this._path, this._urlArgs, this._bodyArgs)
      : assert(_path != null) {
    _method = "POST";
  }

  /// 发送请求
  Future<HttpBaseResult> send() async {
    if (!_path.startsWith(RegExp(r"http[s]?"))) {
      _path = HttpProxy._host + _path;
    }
    HttpBaseResult res = await _doSend();
    return res;
  }

  Future<HttpBaseResult> _doSend() async {
    _setHeaders();
    _setDefaultUrlArgs();
    logger.info("[Requset Headers :] $_headers");
    if (_method == 'POST') {
      HttpBaseResult res = await _sendPost();
      return res;
    } else if (_method == 'GET') {
      HttpBaseResult res = await _sendGet();
      return res;
    } else {
      throw ArgumentError('invalid http method');
    }
  }

  Future<HttpBaseResult> _sendPost() async {
    String data = JsonEncoder().convert(_bodyArgs);
    try {
      logger.verbose("[Send Requset Post: ] $_path \n $data");
      Response response =
          await _dio.post(_path, data: data, queryParameters: _bodyArgs);
      return _handleRes(response);
    } catch (e) {
      logger.error("[117: HTTP 请求失败: ] $_path \n $data \n Error: $e");
      throw e;
    }
  }

  Future<HttpBaseResult> _sendGet() async {
    // _urlArgs["apiKey"] = _apiKey;
    String data = JsonEncoder().convert(_urlArgs);
    try {
      logger.verbose("[Send Requset Get: ] $_path \n $data");
      Response response = await _dio.get(_path, queryParameters: _urlArgs);
      return _handleRes(response);
    } catch (e) {
      logger.error("[HTTP 请求失败: ] $_path \n $data \n Error: $e");
      throw e;
    }
  }

  HttpBaseResult _handleRes(Response response) {
    dynamic result = response.data;
    int httpStatusCode = response.statusCode;
    String msg = response.statusMessage;
    var res = HttpBaseResult();
    if (httpStatusCode != 200) {
      _handleCommonError(httpStatusCode, msg);
      res.code = httpStatusCode.toString();
      res.message = "请求错误";
      res.data = null;
      res.ret = false;
      return res;
    } else {
      if (result is Map) {
        print(result);
        res.code = (result["code"] ??
            result["status"].toString() ??
            httpStatusCode.toString()) as String;
        res.message = (result["message"] ??
            result["code"] ??
            httpStatusCode.toString()) as String;
        res.data = result["data"] ?? {};
        res.ret = (result["ret"] ?? true) as bool;
      } else if (result is List) {
        res.code = httpStatusCode.toString();
        res.message = "ok";
        res.ret = true;
        res.data = result;
      }
      return res;
    }
  }

  void _handleCommonError(int code, String msg) {
    // NOTE: 暂时不处理服务器
    logger.warn("[HTTP 请求失败: ] $_path \n Code: $code \n Msg: $msg");
  }

  void _setHeaders() {
    _headers['Content-Type'] = "application/json";
    // _headers["authorization"] = HttpProxy._token ?? "";
  }

  void _setDefaultUrlArgs() {
    _urlArgs.addAll({
      "openId": "$wxOpenid",
      "unionId": "$wxUnionId",
      "bd_source": "wx",
      "wx_q": "$wxQ",
      "wx_s": "$wxS",
      "wx_t": "$wxT",
      "wx_v": "$wxV",
      "bd_origin": "scene_1001"
    });
  }

  void updateDefualtQueryArgs() {

  }

  void getDefualtQueryArgs() {

  }
}
