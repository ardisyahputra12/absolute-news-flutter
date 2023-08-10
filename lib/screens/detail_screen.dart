import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  String source;
  String title;
  String author;
  String date;
  String image;
  String content;
  String url;
  DetailScreen({
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
    final Uri _url = Uri.parse(url);

    _launchURL() async {
      if (await canLaunchUrl(_url)) {
        await launchUrl(_url);
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          title: 'Gagal!',
          text: 'Terjadi kesalahan pada link yang dituju.',
          confirmBtnText: 'Tutup',
          loopAnimation: true,
          confirmBtnColor: Colors.cyan,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(source)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text('Penulis: ' + author),
              Text('Terbit: ' + date.replaceAll('T', ', ').substring(0, 17)),
              const SizedBox(height: 20),
              Image.network(
                image,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png',
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                content.length > 199
                    ? content.substring(0, 199) + ' ...Baca Selengkapnya'
                    : content,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: SizedBox(
                    width: 180,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.confirm,
                          title: 'Buka browser?',
                          text: 'Anda akan diarahkan ke halaman web ini\n$url.',
                          cancelBtnText: 'Batal',
                          confirmBtnText: 'Oke',
                          showCancelBtn: true,
                          loopAnimation: true,
                          cancelBtnTextStyle:
                              const TextStyle(color: Colors.cyan),
                          confirmBtnColor: Colors.cyan,
                          onConfirmBtnTap: () {
                            Navigator.pop(context);
                            _launchURL();
                          },
                        );
                      },
                      child: const Text('Baca Selengkapnya'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
