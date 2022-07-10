import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:absolute_news/widgets/big_item_widget.dart';
import 'package:absolute_news/widgets/small_item_widget.dart';

class DataProvider extends ChangeNotifier {
  List _data = [];
  List get data => _data;
  set setData(val) {
    _data = val;
    notifyListeners();
  }

  List _dataPencarian = [];
  List get dataPencarian => _dataPencarian;
  set setDataPencarian(val) {
    _dataPencarian = val;
    notifyListeners();
  }

  TextEditingController _search = TextEditingController();
  TextEditingController get search => _search;
  set setSearch(val) {
    _search = val;
    notifyListeners();
  }

  bool _isFetchError = false;
  bool get isFetchError => _isFetchError;
  set setIsFetchError(val) {
    _isFetchError = val;
    notifyListeners();
  }

  Future fecthData(String category, String page) async {
    _data.clear();

    try {
      await http
          .get(Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=id&category=${category}&page=${page}&apiKey=96af7f9749a743fb8a3dd669a8f23bc2',
          ))
          .then(
            (response) => _data = json.decode("[" + response.body + "]"),
          );
    } catch (_) {
      try {
        await http
            .get(Uri.parse(
              'https://newsapi.org/v2/top-headlines?country=id&category=${category}&page=${page}&apiKey=8c267eded2ce47b185eae858a9c48213',
            ))
            .then(
              (response) => _data = json.decode("[" + response.body + "]"),
            );
      } catch (_) {
        try {
          await http
              .get(Uri.parse(
                'https://newsapi.org/v2/top-headlines?country=id&category=${category}&page=${page}&apiKey=eb1f2ee097d34adcb63f07627cfafebf',
              ))
              .then(
                (response) => _data = json.decode("[" + response.body + "]"),
              );
        } catch (_) {
          try {
            await http
                .get(Uri.parse(
                  'https://newsapi.org/v2/top-headlines?country=id&category=${category}&page=${page}&apiKey=8bb4019d7c7f4ba38035001c1e1541f5',
                ))
                .then(
                  (response) => _data = json.decode("[" + response.body + "]"),
                );
          } catch (_) {
            try {
              await http
                  .get(Uri.parse(
                    'https://newsapi.org/v2/top-headlines?country=id&category=${category}&page=${page}&apiKey=42d93d983c194372998d7e4d39727f7d',
                  ))
                  .then(
                    (response) =>
                        _data = json.decode("[" + response.body + "]"),
                  );
            } catch (_) {
              setIsFetchError = true;
            }
          }
        }
      }
    }

    notifyListeners();
  }

  Future fecthDataPencarian(String keyword) async {
    _dataPencarian.clear();

    try {
      await http
          .get(Uri.parse(
            'https://newsapi.org/v2/everything?q=${keyword}&apiKey=96af7f9749a743fb8a3dd669a8f23bc2',
          ))
          .then(
            (response) =>
                _dataPencarian = json.decode("[" + response.body + "]"),
          );
    } catch (_) {
      try {
        await http
            .get(Uri.parse(
              'https://newsapi.org/v2/everything?q=${keyword}&apiKey=8c267eded2ce47b185eae858a9c48213',
            ))
            .then(
              (response) =>
                  _dataPencarian = json.decode("[" + response.body + "]"),
            );
      } catch (_) {
        try {
          await http
              .get(Uri.parse(
                'https://newsapi.org/v2/everything?q=${keyword}&apiKey=eb1f2ee097d34adcb63f07627cfafebf',
              ))
              .then(
                (response) =>
                    _dataPencarian = json.decode("[" + response.body + "]"),
              );
        } catch (_) {
          try {
            await http
                .get(Uri.parse(
                  'https://newsapi.org/v2/everything?q=${keyword}&apiKey=8bb4019d7c7f4ba38035001c1e1541f5',
                ))
                .then(
                  (response) =>
                      _dataPencarian = json.decode("[" + response.body + "]"),
                );
          } catch (_) {
            try {
              await http
                  .get(Uri.parse(
                    'https://newsapi.org/v2/everything?q=${keyword}&apiKey=42d93d983c194372998d7e4d39727f7d',
                  ))
                  .then(
                    (response) =>
                        _dataPencarian = json.decode("[" + response.body + "]"),
                  );
            } catch (_) {
              setIsFetchError = true;
            }
          }
        }
      }
    }

    notifyListeners();
  }

  smallItemDetail(bool isSearch) {
    return List.generate(
        isSearch == true ? dataPencarian[0]['articles'].length : 20, (index) {
      var source = isSearch == true
          ? dataPencarian[0]['articles'][index]['source']['name']
          : data[0]['articles'][index]['source']['name'];
      var title = isSearch == true
          ? dataPencarian[0]['articles'][index]['title']
          : data[0]['articles'][index]['title'];
      var author = isSearch == true
          ? dataPencarian[0]['articles'][index]['author']
          : data[0]['articles'][index]['author'];
      var date = isSearch == true
          ? dataPencarian[0]['articles'][index]['publishedAt']
          : data[0]['articles'][index]['publishedAt'];
      var image = isSearch == true
          ? dataPencarian[0]['articles'][index]['urlToImage']
          : data[0]['articles'][index]['urlToImage'];
      var content = isSearch == true
          ? dataPencarian[0]['articles'][index]['content']
          : data[0]['articles'][index]['content'];
      var url = isSearch == true
          ? dataPencarian[0]['articles'][index]['url']
          : data[0]['articles'][index]['url'];

      return isSearch == true
          ? SmallItemWidget(
              source: source == null ? 'null' : source,
              title: title == null ? 'null' : title,
              author: author == null ? 'null' : author,
              date: date == null ? 'null' : date,
              image: image == null
                  ? 'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png'
                  : image,
              content: content == null ? 'null' : content,
              url: url == null ? 'null' : url,
            )
          : index >= 10
              ? SmallItemWidget(
                  source: source == null ? 'null' : source,
                  title: title == null ? 'null' : title,
                  author: author == null ? 'null' : author,
                  date: date == null ? 'null' : date,
                  image: image == null
                      ? 'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png'
                      : image,
                  content: content == null ? 'null' : content,
                  url: url == null ? 'null' : url,
                )
              : Container();
    });
  }

  bigItemDetail() {
    return List.generate(10, (index) {
      var source = data[0]['articles'][index]['source']['name'];
      var title = data[0]['articles'][index]['title'];
      var author = data[0]['articles'][index]['author'];
      var date = data[0]['articles'][index]['publishedAt'];
      var image = data[0]['articles'][index]['urlToImage'];
      var content = data[0]['articles'][index]['content'];
      var url = data[0]['articles'][index]['url'];
      var description = data[0]['articles'][index]['description'];

      return BigItemWidget(
        source: source == null ? 'null' : source,
        title: title == null ? 'null' : title,
        author: author == null ? 'null' : author,
        date: date == null ? 'null' : date,
        image: image == null
            ? 'https://functionalsoftware.net/wp-content/uploads/2015/09/null-Verboten-900x550.png'
            : image,
        content: content == null ? 'null' : content,
        url: url == null ? 'null' : url,
        desc: description == null ? 'null' : description,
      );
    });
  }
}
