import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TestRouteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          tooltip: '返回',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          children: <Widget>[
            // MyButtonWidget(),
            // CounterWidget(),
            // Counter(),
            // ImageTestRoute(),
            CacheImageRoute(),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {},
      // ),
    );
  }
}

// 按钮添加手势
class MyButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("MyButton was tapped!");
      },
      child: Container(
        height: 36.0,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: Text('Engage'),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text('Increment'),
          onPressed: () {
            _increment();
          },
        ),
        Text("Count: $_counter"),
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Text("Count: $count");
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  CounterIncrementor({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment+'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState01 createState() => _CounterState01();
}

class _CounterState01 extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CounterIncrementor(
          onPressed: _increment,
        ),
        CounterDisplay(
          count: _counter,
        ),
      ],
    );
  }
}

class ImageTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image:
            'http://img4.duitang.com/uploads/item/201308/15/20130815174605_8vmUU.thumb.700_0.jpeg',
      ),
    );
  }
}

class CacheImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl:
            'http://pic1.win4000.com/wallpaper/2018-03-28/5abafe0c311e6.jpg',
        placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
