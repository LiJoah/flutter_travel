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
    _focusNode.unfocus();
    _focusNode = null;
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 14.0, color: Colors.black26);
    return TextField(
        focusNode: _focusNode,
        textAlign: TextAlign.left,
        controller: _controller,
        style: TextStyle(color: Colors.white),
        // 点击了键盘上的完成按键, 提交数据
        onSubmitted: (value) {
          widget._eventEmiter
              .emit("submit", {"value": value, "focusNode": _focusNode});
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            // hintStyle: style,
            labelText: _lableText,
            labelStyle: style));
  }
}
