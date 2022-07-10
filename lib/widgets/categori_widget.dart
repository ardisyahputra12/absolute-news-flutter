import 'package:absolute_news/widgets/item_categori_widget.dart';
import 'package:flutter/material.dart';

class CategoriWidget extends StatelessWidget {
  const CategoriWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 30,
      mainAxisSpacing: 20,
      children: [
        ItemCategoriWidget(
          category: 'business',
          page: '1',
          image: './assets/images/icons8-bussiness-64.png',
          title: 'Bisnis',
        ),
        ItemCategoriWidget(
          category: 'technology',
          page: '1',
          image: './assets/images/icons8-technology-64.png',
          title: 'Teknologi',
        ),
        ItemCategoriWidget(
          category: 'health',
          page: '1',
          image: './assets/images/icons8-health-64.png',
          title: 'Kesehatan',
        ),
        ItemCategoriWidget(
          category: 'entertainment',
          page: '1',
          image: './assets/images/icons8-entertainment-64.png',
          title: 'Entertainment',
        ),
        ItemCategoriWidget(
          category: 'science',
          page: '1',
          image: './assets/images/icons8-science-48.png',
          title: 'Sains',
        ),
        ItemCategoriWidget(
          category: 'sports',
          page: '1',
          image: './assets/images/icons8-sport-64.png',
          title: 'Olahraga',
        ),
      ],
    );
  }
}
