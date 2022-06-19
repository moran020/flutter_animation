import 'package:flutter/material.dart';
import 'dart:math' as math;

class DropdownList extends StatefulWidget {
  const DropdownList({Key? key}) : super(key: key);

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> roration;
  bool show = false;

// Инициализация контроллера и анимации вращения
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    roration = Tween<double>(begin: 0, end: 1 * math.pi).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 330,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Winnie The Pooh',
                    style: TextStyle(fontSize: 22),
                  ),
                  // Кнопка стрелки
                  GestureDetector(
                    child: Transform.rotate(
                      angle: roration.value,
                      child: const Icon(Icons.south),
                    ),
                    onTap: () {
                      if (show == false) {
                        controller.forward();
                        show = true;
                      } else if (show == true) {
                        controller.reverse();
                        show = false;
                      }
                    },
                  ),
                ]),
          ),
        ),
        // Выезжающий список
        SizeTransition(
            sizeFactor: controller,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: Card(
              child: Container(
                width: 330,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Type: Honey Bear', style: TextStyle(fontSize: 19)),
                    Text('Color: Brown or Yellow',
                        style: TextStyle(fontSize: 19)),
                    Text('Song: V golove moiyei opilki...',
                        style: TextStyle(fontSize: 19))
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
