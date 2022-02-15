import 'package:flutter/material.dart';

class DogSelected extends StatelessWidget {
  const DogSelected(
      {Key? key,
      required this.imageUrl,
      required this.bredFor,
      required this.weigth,
      required this.name,
      required this.lifespan})
      : super(key: key);

  final String? imageUrl;
  final String? bredFor;
  final String? name;
  final String? weigth;
  final String? lifespan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(13),
          child: Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.width * 0.4,
              child: Image.network(imageUrl ?? ""),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.width * 0.4,
          child: Text(name ?? ""),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.width * 0.4,
          child: Text("Bred for: $bredFor"),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.width * 0.4,
          child: Text("lifespan: $lifespan years"),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.width * 0.4,
          child: Text("Weigth: $weigth"),
        )
      ]),
    );
  }
}
