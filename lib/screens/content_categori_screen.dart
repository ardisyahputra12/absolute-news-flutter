import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/widgets/card_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentCategoriScreen extends StatelessWidget {
  String title;
  String category;
  String page;
  ContentCategoriScreen({
    Key? key,
    required this.title,
    required this.category,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provData = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: RefreshIndicator(
        onRefresh: () async {
          provData.setIsFetchError = false;
          provData.data.clear();
          return await provData.fecthData(category, page);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: provData.isFetchError
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Text(
                      'Gagal memuat data.\nSilahkan cek koneksi internet Anda!\nJika masalah ini masih terus terjadi, mohon sabar untuk menunggu dalam 24 jam ke depan.',
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  )
                : provData.data.isEmpty
                    ? const CardLoadingWidget()
                    : Column(
                        children: provData.smallItemDetail(false),
                      ),
          ),
        ),
      ),
    );
  }
}
