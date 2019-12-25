import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_travel/pages/index/components/bottom_nav.dart';
import 'package:flutter_travel/pages/index/home.dart';
import 'package:flutter_travel/pages/index/journey.dart';
import 'package:flutter_travel/pages/index/me.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget {
  final List<Widget> _w = [HomePage(), JourneyPage(), MePage()];

  Widget _renderContent(int index) {
    return _w[index];
  }

  @override
  Widget build(BuildContext context) {
    final IndexStore indexStore = Provider.of<IndexStore>(context);
    return Scaffold(
      appBar: AppBar(
          // 标题居中
          centerTitle: true,
          // 去掉阴影
          elevation: 0,
          title: Observer(
            builder: (_) {
              return Text(
                indexStore.indexAppBarTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              );
            },
          )),
      bottomNavigationBar: BottomNavComponent(),
      body: Center(
        child: Observer(
          builder: (_) {
            int index = indexStore.currentTabIndex;
            return _renderContent(index);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     indexStore.increment();
      //     globalStore.changeName();
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
