import 'package:absolute_news/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class BigItemWidget extends StatelessWidget {
  String source;
  String title;
  String author;
  String date;
  String image;
  String content;
  String url;
  String desc;
  BigItemWidget({
    Key? key,
    required this.source,
    required this.title,
    required this.author,
    required this.date,
    required this.image,
    required this.content,
    required this.url,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 7,
        right: 7,
      ),
      child: GestureDetector(
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 7),
              ),
            ],
            border: Border.all(color: Colors.white, width: 0.2),
          ),
          width: 250,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  image,
                  width: 250,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png',
                      width: 250,
                      height: 150,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      desc,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
