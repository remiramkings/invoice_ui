import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ui_project/service/download_image_service.dart';

class ImageDownload extends StatefulWidget {
  const ImageDownload({super.key});

  @override
  State<ImageDownload> createState() => _ImageDownloadState();
}

class _ImageDownloadState extends State<ImageDownload> {
  final String imageUrl = "https://picsum.photos/250?image=17";
  String downloadedFilePath = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download network image')),
      body: Center(
        child: Container(
          padding:const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.network(imageUrl),
              ElevatedButton(
                  onPressed: () {
                    DownloadImageService.getInstance()
                        .downloadNetworkImage("image_kings", imageUrl)
                        .then((File? file) {
                      if (file == null) {
                        return;
                      }
                      setState(() {
                        downloadedFilePath = file.path;
                      });
                    }).catchError((err) {
                      print(err);
                    });
                  },
                  child: const Text('Download')),
              downloadedFilePath.isNotEmpty
                  ? Text.rich(TextSpan(children: [
                      const TextSpan(text: 'Downloaded file path: '),
                      TextSpan(
                          text: downloadedFilePath,
                          style:const TextStyle(fontWeight: FontWeight.bold)),
                    ]))
                  : const Text('')
            ],
          ),
        ),
      ),
    );
  }
}
