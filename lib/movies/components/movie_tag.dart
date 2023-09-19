import 'package:flutter/material.dart';

class MovieTag extends StatelessWidget {
  final List<String> tags;

  MovieTag({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tags.map((tag) {
          return Chip(label: Text(tag));
        }).toList(),
      ),
    );
  }
}