import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_application/View/home_page.dart';

import 'Utils/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends GetWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomePage(),
      theme: CupertinoThemeData(
        primaryColor: ColorsUtil.black,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
