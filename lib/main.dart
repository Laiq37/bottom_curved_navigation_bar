import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: Scaffold(
        body: ClipPath(child: Container(height: 250, color: Colors.amber[300],), clipper: WaveyClipper(),),
        bottomNavigationBar: ClipPath(
          child: Container(
            child: Row(
              children: [
                Icon(Icons.home, size: 40,),
                Icon(Icons.account_balance, size: 40,),
                Icon(Icons.person, size: 40,),
                Icon(Icons.chat_bubble_outline_rounded, size: 40,),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            color: Colors.amber[300],
            height: 50,
          ),
          clipper: BottomBarCenterCurveClipper(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.done),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class WaveyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width*0.3, size.height);
    final Offset firstControlPoint = Offset(size.width*0.4, size.height-50);
    final Offset firstEndPoint = Offset(size.width*0.5, size.height-10);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    final Offset secondControlPoint = Offset(size.width*0.65, size.height);
    final Offset secondEndPoint = Offset(size.width*0.95, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}

class BottomBarCenterCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width * 0.555, 0.0);// 0.5325
    Offset firstControlPoint = Offset(size.width * 0.555, size.height *0.4);//0.5325
    Offset firstEndPoint = Offset(size.width * 0.5225, size.height *0.6);//0.5125
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    Offset secondControlPoint = Offset(size.width * 0.5, size.height *0.7);
    Offset secondEndPoint = Offset(size.width -(size.width * 0.5225), size.height *0.6);//0.5125
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    // path.lineTo(size.width*0.46, y)
    Offset thirdControlPoint = Offset(size.width - (size.width * 0.555), size.height *0.4);//0.535
    Offset thirdEndPoint = Offset(size.width * 0.445, 0.0);//0.4675
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);
    // path.lineTo(size.width*0.45, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}