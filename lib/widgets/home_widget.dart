import 'package:absolute_news/providers/bottom_navigation_provider.dart';
import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/widgets/card_loading_widget.dart';
import 'package:absolute_news/widgets/chip_categori_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provData = Provider.of<DataProvider>(context);
    final provBottomNav = Provider.of<BottomNavigationBarProvider>(context);

    search() async {
      if (provData.search.text.isNotEmpty) {
        await provData.fecthDataPencarian(provData.search.text);
        (context as Element).reassemble();
      } else {
        provData.dataPencarian.clear();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         CircleAvatar(
                    //           radius: 20,
                    //           backgroundImage: AssetImage('./assets/images/logo.png'),
                    //         ),
                    //         const SizedBox(width: 15),
                    //         Text(
                    //           'Halo, \nAbsoluteNews',
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          controller: provData.search,
                          onSubmitted: (val) async {
                            onLoading();
                            await search();
                            Navigator.pop(context);
                            provBottomNav.setCurrentIndex = 4;
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
                                provBottomNav.setCurrentIndex = 4;
                              },
                              icon: const Icon(Icons.search_rounded),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Berita Terbaru',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: provData.bigItemDetail(),
                        ),
                      ),
                    ),
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 30,
                        left: 10,
                      ),
                      child: Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          ChipCategoriWidget(
                            category: 'business',
                            page: '1',
                            image: './assets/images/icons8-bussiness-64.png',
                            label: 'Bisnis',
                          ),
                          ChipCategoriWidget(
                            category: 'technology',
                            page: '1',
                            image: './assets/images/icons8-technology-64.png',
                            label: 'Teknologi',
                          ),
                          ChipCategoriWidget(
                            category: 'health',
                            page: '1',
                            image: './assets/images/icons8-health-64.png',
                            label: 'Kesehatan',
                          ),
                          ChipCategoriWidget(
                            category: 'science',
                            page: '1',
                            image: './assets/images/icons8-science-48.png',
                            label: 'Sains',
                          ),
                          ChipCategoriWidget(
                            category: 'entertainment',
                            page: '1',
                            image:
                                './assets/images/icons8-entertainment-64.png',
                            label: 'Entertainment',
                          ),
                          ChipCategoriWidget(
                            category: 'sports',
                            page: '1',
                            image: './assets/images/icons8-sport-64.png',
                            label: 'Olahraga',
                          ),
                          TextButton(
                            onPressed: () {
                              provBottomNav.setCurrentIndex = 1;
                            },
                            child: const Text('Lihat kategori'),
                          )
                        ],
                      ),
                    ),
                    const Text(
                      'Berita Terpopuler',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: provData.smallItemDetail(false),
                      ),
                    ),
                  ],
                ),
    );
  }
}
