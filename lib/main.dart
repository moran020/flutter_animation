import 'package:basic_animations/Animations/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:basic_animations/Animations/rotation_image.dart';
import 'package:basic_animations/Animations/hero_animation.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: const [
                  SizedBox(height: 45),
                  RotationImage(),
                  SizedBox(height: 20),
                  DropdownList(),
                  SizedBox(height: 20),
                  HeroMainScreen(),
                ],
              )),
        ),
      ),
    );
  }
}
