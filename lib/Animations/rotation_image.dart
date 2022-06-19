import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class RotationImage extends StatefulWidget {
  const RotationImage({Key? key}) : super(key: key);

  @override
  State<RotationImage> createState() => _RotationImageState();
}

class _RotationImageState extends State<RotationImage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

// Инициализация контроллера
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 7))
          ..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animationController,
      child: FadeInImage.memoryNetwork(
        width: 250,
        // Плавное появление изображения
        placeholder: kTransparentImage,
        image:
            'https://i.pinimg.com/474x/6e/c1/d7/6ec1d708429bb0840ac5c9a8fedd3ef4.jpg',
      ),
    );
  }
}
