import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Уменьшенное изображение и кнопка
class HeroMainScreen extends StatelessWidget {
  const HeroMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HeroDetailScreen();
                  }));
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ClipOval(
                      child: FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          // Плавное появление изображения
                          placeholder: kTransparentImage,
                          image:
                              'https://avatars.mds.yandex.net/get-zen_doc/1661927/pub_5de3cda1d5bbc300ae3bd228_5de3cfdd34808200b02ef3b3/scale_1200'),
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HeroDetailScreen()),
                  );
                },
                child: const Text('Show me BIGGER Winnie'))
          ],
        ),
      ),
    );
  }
}

// Увеличенное изображение
class HeroDetailScreen extends StatelessWidget {
  const HeroDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://avatars.mds.yandex.net/get-zen_doc/1661927/pub_5de3cda1d5bbc300ae3bd228_5de3cfdd34808200b02ef3b3/scale_1200',
            ),
          ),
        ),
      ),
    );
  }
}
