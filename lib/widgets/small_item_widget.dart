import 'package:absolute_news/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class SmallItemWidget extends StatelessWidget {
  String source;
  String title;
  String author;
  String date;
  String image;
  String content;
  String url;
  SmallItemWidget({
    Key? key,
    required this.source,
    required this.title,
    required this.author,
    required this.date,
    required this.image,
    required this.content,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  source: source,
                  title: title,
                  author: author,
                  date: date,
                  image: image,
                  content: content,
                  url: url,
                ),
              ),
            );
          },
          contentPadding: const EdgeInsets.all(0),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image,
                  width: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png',
                      width: 150,
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Text(date.replaceAll('T', ', ').substring(0, 17)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
