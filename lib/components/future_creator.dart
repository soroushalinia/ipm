import 'package:flutter/material.dart';

class FutureCreator extends StatelessWidget {
  final Future<dynamic>? future;
  final Widget Function(AsyncSnapshot<dynamic> snapshot) builder;
  const FutureCreator({super.key, this.future, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("خطا: ${snapshot.error}"),
          );
        } else {
          return builder(snapshot);
        }
      },
    );
  }
}
