import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:my_hidden_photo/Cubits/ResultCubit/result_cubit.dart';
import 'package:my_hidden_photo/Data/temp_path.dart';
import 'package:path_provider/path_provider.dart';

class Result extends StatelessWidget {
  final Image image;
  Result(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tadam"),
        ),
        body: Column(
          children: [
            image,
            IconButton(
                onPressed: () async {
                  print("Loading image from $tempPath");
                  Directory.fromUri(Uri.file("/data/user/0/com.example.my_hidden_photo/cache")).listSync();
                  await GallerySaver.saveImage(await tempPath);
                },
                icon: Icon(Icons.download)),
          ],
        ));
  }

  Widget buildView(BuildContext context) {
    return Container();
  }
}
