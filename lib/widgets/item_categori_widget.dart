import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/screens/content_categori_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCategoriWidget extends StatelessWidget {
  String image;
  String title;
  String category;
  String page;
  ItemCategoriWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.category,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DataProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        prov.setData = [];
        prov.fecthData(category, page);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentCategoriScreen(
              title: title,
              category: category,
              page: page,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
          color: Colors.white70,
          border: Border.all(
            width: 0.2,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 80,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
