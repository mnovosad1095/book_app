import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Book Sug'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent[100],
        body:
            Stack(children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Container(
                            child: BookButton(),
                            alignment: Alignment.center,
                        )
                    ],),
                Container(
                    child: TopBar(),
                    alignment: Alignment.topCenter,
                )
            ],)


    );
  }
}


class TopBar extends StatelessWidget {
    double _height = 80;
    double _width = 350;

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.all(25),
            height: _height,
            width: _width,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigo,
                boxShadow: [BoxShadow(color: Colors.white70)],

            ),
            alignment: Alignment.topCenter,
            child: Row(
                children: <Widget>[
                    Icon(Icons.cake)
                ],
            ),
    );
  }
}


class BookButton extends StatefulWidget {
    BookButton({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _BookButtonState createState() => _BookButtonState();

}

class _BookButtonState extends State<BookButton> {
    List<String> _strList = ['one', 'two', 'three'];
    int _index = 0;
    String _title = "one";
    double _height = 200;
    double _width = 200;

    void changeText(){
        setState(() {
          _index = ((_index+1)%3);
          _title = _strList[_index];
        });
    }

    @override
    Widget build(BuildContext context) {
        return new InkWell(
            onTap: changeText,
            child: new Container(
                height: _height,
                width: _width,
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(25),
                    color: Colors.indigo,
                ),
                child: Center(child:
                Text(_title,
                    style:
                        TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontStyle: FontStyle.italic
                        ),
                    ),
                )
            ) ,
        );
  }
}
