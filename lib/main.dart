
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';//导入english_word第三方库

/*
*main函数是应用程序的入口,main函数中调用了runApp方法,它的功能是启动Flutter 应用。runApp接受一个Widget函数,在本例子中它是一个MyApp对象,MyApp()是Flutter应用的入口函数
*
* */

void main() {
  runApp(MyApp());
}
/*
* 当app正在运行的时候,热更新将会刷新更新的app.每次热更新或者保存项目的时候,你都会看到不同的一个单词,这个单词是随机的。这是因为在build方法体内会生词而过一个单词。
*
*创建一个Stateful Widget类至少需要两个步骤:
* 1.创建Stataful widget类
* 2.创建State类
*
*
* */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      应用名称
      title: 'Flutter Demo',
      theme: new ThemeData(
//        蓝色主题
        primarySwatch: Colors.blue,
      ),
//      应用首页路由
      home: new MyHomePage(title:'Flutter Demo Home Page'),
    );
  }
}

/*
* MyHomePage是Flutter应用的首页,它继承自StatefulWidget类,表示它是一个有状态的组件(Stateful widget).关于Stateful widget我们将在第三章中仔细介绍。有状态的组件和无状态的组件有两点不同:
* 1.stateful widget 可以拥有状态,这些状态再widget声明周期中是可以变的,而Stateless widget是不可变的
* 2.Stateful widget至少由两个类组成:
* (1)一个Stateful widget类
* (2)一个State类;StatefulWidget类本身只不变的,但是State类中持有的装填在widget生命周期中可能会发生变化
*
* */
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;//用于记录按钮点击的中次数

  void _incrementCounter() {
    setState(() {//改方法的作用是通知Flutter框架,有状态发生改变之后,Flutter框架收到通知后,会执行build方法来根据新的状态重新构建界面,Flutter对此方法做了优化,是重新执行变得很快,所有你可以重新构建任何需要更新的东西,而无需更新的东西，不需要分别去修改各个widget
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return NewRoute();
            })
          );
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}