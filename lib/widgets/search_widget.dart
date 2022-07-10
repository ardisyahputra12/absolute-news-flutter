import 'package:absolute_news/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DataProvider>(context, listen: false);

    search() async {
      if (prov.search.text.isNotEmpty) {
        await prov.fecthDataPencarian(prov.search.text);
        (context as Element).reassemble();
      } else {
        prov.dataPencarian.clear();
      }
    }

    onLoading() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: LoadingAnimationWidget.beat(
              color: Colors.cyan,
              size: 60,
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: prov.search,
              onSubmitted: (val) async {
                onLoading();
                await search();
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Cari berita',
                suffixIcon: IconButton(
                  onPressed: () async {
                    onLoading();
                    await search();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          prov.dataPencarian.isEmpty
              ? Center(
                  child: Text(
                    prov.isFetchError
                        ? 'Gagal memuat data.\nSilahkan cek koneksi internet Anda!\nJika masalah ini masih terus terjadi, mohon sabar untuk menunggu dalam 24 jam ke depan.'
                        : 'Data tidak ada.',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                )
              : prov.dataPencarian[0]['totalResults'] == 0
                  ? const Center(
                      child: Text(
                        'Pencarian tidak ditemukan!\nGunakan kata kunci pencarian yang sesuai.',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Column(
                      children: prov.smallItemDetail(true),
                    ),
        ],
      ),
    );
  }
}
