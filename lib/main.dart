import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: icon(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class icon extends StatefulWidget {
  const icon({Key? key}) : super(key: key);

  @override
  State<icon> createState() => _iconState();
}

class _iconState extends State<icon> {
  int? _currIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      body: Center(
        child: IconButton(
          icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 1).animate(anim)
                    : Tween<double>(begin: 1, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: _currIndex == 0
                  ? Icon(Icons.keyboard_arrow_right, size: 40, key: const ValueKey('icon1'))
                  : Icon(
                Icons.keyboard_arrow_down, size: 40,
                key: const ValueKey('icon2'),
              )),
          onPressed: () {
            setState(() {
              _currIndex = _currIndex == 0 ? 1 : 0;
            });
          },
        ),
      ),
    );
  }
}
