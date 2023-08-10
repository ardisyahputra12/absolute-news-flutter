import 'package:absolute_news/providers/edit_profil_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconButtonProfileWidget extends StatelessWidget {
  bool isGallery;
  IconData icon;
  String title;
  IconButtonProfileWidget({
    Key? key,
    required this.isGallery,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final editProv = Provider.of<EditProfilProvider>(context);

    return Column(
      children: [
        IconButton(
          onPressed: () async {
            Navigator.pop(context);
            await editProv.editPhoto(isGallery);
          },
          icon: Icon(
            icon,
            size: 30,
          ),
        ),
        Text(title),
      ],
    );
  }
}
