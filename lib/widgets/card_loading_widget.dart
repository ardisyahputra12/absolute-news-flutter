import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CardLoadingWidget extends StatelessWidget {
  const CardLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CardLoading(
          height: 40,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const SizedBox(height: 20),
        const CardLoading(
          height: 20,
          width: 100,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const CardLoading(
          height: 120,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const SizedBox(height: 20),
        const CardLoading(
          height: 20,
          width: 100,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        CardLoading(
          height: 25,
          width: MediaQuery.of(context).size.width / 1.3,
          borderRadius: 15,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        CardLoading(
          height: 25,
          width: MediaQuery.of(context).size.width / 1.3,
          borderRadius: 15,
          margin: const EdgeInsets.only(bottom: 10),
        ),
        const SizedBox(height: 20),
        const CardLoading(
          height: 20,
          width: 100,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const CardLoading(
          height: 80,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const CardLoading(
          height: 80,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const CardLoading(
          height: 80,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
        const CardLoading(
          height: 80,
          borderRadius: 15,
          margin: EdgeInsets.only(bottom: 10),
        ),
      ],
    );
  }
}
