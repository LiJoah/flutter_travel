# flutter_travel

## 仿去哪儿网(flutter + mobx + h5 + fish-redux)

> 运行项目需在 `lib/configs` 文件夹下新建 `scret_config.dart` 文件, 内容如下;

```dart
  // 如下是去哪儿网请求接口需要的认证参数(星标的是重要必须的参数)
  const *wxAppid = "";

  const *wxUnionId = "";

  const *wxV = "";

  const *wxS = "";

  const wxT = "";

  const *wxQ = "";

  const wxI = "";

  const *csrfToken = "";

  const *qunarGlobal = "";

  const weChatPlatform = "";

  const clientJson = "";

  const *uuid = "";

  const version = "";
```

### 开发中问题总结

- 升级支持 `Android-X`; 使用 `AS` 进行升级;

  - 使用 `AS` 打开 `flutter` 项目的 `Android` 的目录;

  - File -> Sync Project with Gradle Files (这个时候会构建, 如果构建出错那么将不能升级成功, 必须要解决所有的错误, 如果遇到一些莫名错误, 可以使用 `flutter clean` 清除一下缓存, 然后重新 `flutter run` 运行一下项目, 保证项目可以正常的运行);

  - 构建成功之后; -> Refactor -> Migrate AndroidX 点击升级完成就好, 之后右下角会出现两个小按钮, 点击 Do Refactor

- 项目接入高德 Api; 使用第三方包 amap_location_fluttify

  - 接入的过程中, 经纬度一直出现 (0, 0); 我遇到的是: 在生成高德 api-key 中的 SHA1 签名的错误, 网上说会有签名错误的抛出, 但是使用这个包, 在调试的过程中, 并没有看到有鉴权错误抛出, 之后我排查了 SHA1; 但是 SHA1 并没有问题, 之后我看了 Android 的 main 下的 AndroidManifest.xml 文件中对于 key 的配置, 这个标签应该在 `<application>` 直接子元素下, 我将其放在了 `<activity>` 下; 导致的问题

  ```xml
    <meta-data
      android:name="com.amap.api.v2.apikey"
      android:value="your-key" />
  ```

  - SHA1 开发版 可以使用 `AS` 生成, 或者是使用 keytool 工具生成;

  - SHA1 发布版就使用 `AS` 构建的时候会生成

- 接入权限访问; 使用 `permission_handler` 这个第三方库

  - 如果不配置 AndroidX 的对应的配置, 那么就会出现 `MissingPluginException(No implementation found for method init on channel plugins.flutter.io/google_sign_in` 这个错误

  - 在 `gradle.properties` 文件中添加配置:

  ```properties
    android.enableJetifier=true

    android.useAndroidX=true
  ```

- 升级完成 AndroidX 之后, 使用 AS 打开 flutter 项目, 出现: 运行的 main 文件不在当前项目中; 导致 `AS` 不能成功识别flutter项目, 导致了项目的结构混乱;

  - 网上的答案众说纷纭, 但是我使用了如下方式解决;

    - 打开 Flutter 项目, File -> Preject Structure -> Modules -> 然后将右边的项目 root 调整为正确的项目根目录;

- 使用 ListView 时, 产生的高度 `double.infinity` 的报错,

  - 使用 ListView 时, 如果不确定高度时, 需要根据内容来计算; 那么要避免出现高度错误, 1, 使用 `Container` 容器进行包裹, 然后将 `ListView` `shrinkWrap: true` 设置为 ture, 还有使用 `Expand` 元素进行包裹, 或者是使用 `Flexable` 元素进行包裹, 都没有很好的解决;

- 使用 `Container` 的尺寸计算的问题;

  - 如果要使用 `Container` 来创建三个尺寸不一样的容器, 那么如果不进行处理, 子的 Container, 会直接根据父 `Container` 来计算, 即使子 `Container` 定义了宽和高, 那么这样需要使用 `Column` 元素来将子的 `Container` 进行包裹一层, 这是因为 `Row` 和 `Column` 元素会将尺寸重新计算

- input TextField 的边框问题:

  - input 的边框颜色都是获取焦点时候的颜色, 当失去焦点的时候, 都是黑色, 这个要改变需要使用 `Theme` 控件来进行包装

    ```dart
    // foucs
      Theme(
        data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
        child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                //borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid) //没什么卵效果
          )),
        ),
      );
    ```

    - 在失去焦点的输入框会有黑色的边框, 如果将 border 属性改为 focusedBorder, 那么会出现文本根据 baseline 对齐, 那么会出现垂直不居中, 我改为这样就好了;

    ```flutter
      TextField(
        focusNode: _focusNode,
        textAlign: TextAlign.left,
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: Colors.black45,
          textBaseline: TextBaseline.alphabetic,
        ),
        // 点击了键盘上的完成按键, 提交数据
        onSubmitted: (value) {
          if (value.isEmpty) {
            widget._eventEmiter
                .emit("submit", {"value": value, "focusNode": _focusNode});
          }
        },
        decoration: InputDecoration(
          <!-- NOTE: foucsedBorder 和 enabledBorder 一起设置, 并设置为相同的值 -->
          focusedBorder: _border(),
          enabledBorder: _border(),

          // border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.0),

          hintStyle: style,
          hintText: _lableText,
          // labelStyle: style,
        ));
    ```

  - input 的内容不垂直居中, 需要设置 border,

    ```flutter
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          // border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.0),
          hintStyle: style,
          hintText: _lableText,
          // labelStyle: style,
        )
    ```

  - input 添加了 `suffix` 的内容不垂直居中, 需要设置 border 和 将 `suffix` 改为 `suffixIcon`

    - 因为 suffix 和 text 是 baseline 对齐的;
