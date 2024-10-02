import 'package:flutter/material.dart';

@immutable
class Person {
  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
  final String name;
  final String emoji;
  final int age;
}

const people = [
  Person(name: 'Nick', age: 30, emoji: '👨‍💻'),
  Person(name: 'Zay', age: 27, emoji: '🧑‍🎤'),
  Person(name: 'Sheryl', age: 25, emoji: '👩‍🏫'),
];
