import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel/base/event_emitter.dart';

/// 搜索条
class InputTextField extends StatefulWidget {
  /// 事件发射实例
  // final String _placeholder;
  final String _label;
  final EventEmitter _eventEmiter;

  InputTextField(this._label, this._eventEmiter);

  @override
  _InputTextFieldState createState() {
    return _InputTextFieldState();
  }
}

class _InputTextFieldState extends State<InputTextField> {
  FocusNode _focusNode = FocusNode();

  TextEditingController _controller = TextEditingController();

  String _lableText;
  @override
  void initState() {
    super.initState();
    _lableText = widget._label;
    _initEvents();
  }

  _initEvents() {
    // 清除数据
    widget._eventEmiter.on("clearValue", (_) {
      _focusNode.unfocus();
      _controller.clear();
    });
    // 失去焦点
    widget._eventEmiter.on("blur", (_) {
      print("get event blur");
      _focusNode.unfocus();
    });
    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     setState(() {
    //       _lableText = "";
    //     });
    //   } else {
    //     setState(() {
    //       _lableText = widget._label;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.clear();
    _controller = null;
    _focusNode.unfocus();
    _focusNode = null;
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14.0, color: Colors.black26);
    return TextField(
        focusNode: _focusNode,
        textAlign: TextAlign.left,
        controller: _controller,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.done,
        style: TextStyle(
          color: Colors.black45,
          textBaseline: TextBaseline.alphabetic,
        ),
        // 点击了键盘上的完成按键, 提交数据
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget._eventEmiter
                .emit("submit", {"value": value, "focusNode": _focusNode});
          }
        },
        decoration: InputDecoration(
          focusedBorder: _border(),
          enabledBorder: _border(),

          // border: InputBorder.none,
          contentPadding: EdgeInsets.all(10.0),

          hintStyle: style,
          hintText: _lableText,
          // labelStyle: style,
        ));
  }
}
