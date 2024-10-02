import 'package:flutter/material.dart';
import 'package:hero_animation/person.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.person, super.key});
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: toHeroContext.widget,
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: ScaleTransition(
                    scale: animation.drive(
                      Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).chain(
                        CurveTween(
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    child: fromHeroContext.widget,
                  ),
                );
            }
          },
          tag: person.name,
          child: Center(
            child: Text(
              person.emoji,
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Age: ${person.age}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
