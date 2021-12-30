import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsUtil {
  static const black = Color(0xff1C1F1D);
  static const white = Color(0xffF1F3F2);
  static const transparent = Color(0x00000000);
  static const slightlyBlack = Color.fromRGBO(23, 32, 42, 0.7);
}

class APIs {
  static const apiKey = "706036ae93e884161c7e1c3717381f8f";
  static const readAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MDYwMzZhZTkzZTg4NDE2MWM3ZTFjMzcxNzM4MWY4ZiIsInN1YiI6IjYxY2Q4NzgwNTNmODMzMDA5NGY1MmQwYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.GOx4KnTy8ujrsXPeaKcop-rUQdD7kjt5F8yhv7uQjnY";
}

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const ModifiedText({Key key, this.text, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
