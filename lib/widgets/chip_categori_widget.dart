import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/screens/content_categori_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChipCategoriWidget extends StatelessWidget {
  String image;
  String label;
  String category;
  String page;
  ChipCategoriWidget({
    Key? key,
    required this.image,
    required this.label,
    required this.category,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DataProvider>(context, listen: false);

    return ActionChip(
      elevation: 7,
      avatar: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(image),
      ),
      label: Text(label),
      onPressed: () {
        prov.setData = [];
        prov.fecthData(category, page);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContentCategoriScreen(
              title: label,
              category: category,
              page: page,
            ),
          ),
        );
      },
    );
  }
}
