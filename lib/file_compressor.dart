import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:ui_project/model/file_object.dart';
import 'package:ui_project/service/file_picker_service.dart';
import 'package:ui_project/service/media_compress_service.dart';
import 'package:video_compress_plus/video_compress_plus.dart';

class FileCompressor extends StatefulWidget {
  const FileCompressor({super.key});

  @override
  State<FileCompressor> createState() => _FileCompressorState();
}

class _FileCompressorState extends State<FileCompressor> {
  FileObject? file;
  Future<MediaInfo?>? videoInfoFuture;
  Future<XFile?>? imageInfoFuture;
  int compressedFIleLength = 0;
  showImage() {
    return Column(
      children: [
        SizedBox(height: 250, child: Image.file(File(file!['path'] ?? ''))),
        Text('Size: ${((int.parse(file!['size'] ?? '') / 1024)).round()} Kb'),
      ],
    );
  }

  getCompressedImageLength(XFile file) async {
    int len = await file.length();
    setState(() {
      compressedFIleLength = len;
    });
  }

  showVideo() {
    return Column(
      children: [
        Image.asset('assets/images/video.png'),
        Text('Size: ${((int.parse(file!['size'] ?? '') / 1024)).round()} Kb')
      ],
    );
  }

  String getExtension(){
    return (file != null) ? FileExtensions[file!['extension']] ?? '' : '';
  }

  isVideo() {
    return (getExtension()) == 'video';
  }

  showMedia() {
    Widget mediaWidget = Text('');
    if (isVideo()) {
      mediaWidget = showVideo();
    } else {
      mediaWidget = showImage();
    }

    return Column(
      children: [
        mediaWidget,
        ElevatedButton(
            onPressed: () {
              if (isVideo()) {
                setState(() {
                  videoInfoFuture = MediaCompressService.compressVideo(
                      file!['path'] ?? '', VideoQuality.LowQuality);
                });
              } else {
                setState(() {
                  imageInfoFuture =
                      MediaCompressService.imageCompressAndGetFile(
                          File(file!['path'] ?? ''));
                });
              }
            },
            child: Text('Compress ${getExtension()}'))
      ],
    );
  }

  showResult() {
    return Column(
      children: [
        !isVideo() ? FutureBuilder<XFile?>(
          future: imageInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.data != null) {
              getCompressedImageLength(snapshot.data!);
            }
            return snapshot.data != null
                ? Column(
                    children: [
                      Text(
                          'Compression finished, compressed to ${((compressedFIleLength) / 1024).round()} Kb'),
                      SizedBox(
                        height: 250,
                        child: Image.file(File(snapshot.data!.path))
                      )
                    ],
                  )
                : const Text('');
          },
        ):
        FutureBuilder<MediaInfo?>(
          future: videoInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.data != null) {
              compressedFIleLength = snapshot.data!.filesize ?? 0;
            }
            return snapshot.data != null
                ? Column(
                    children: [
                      Text(
                          'Compression finished, compressed to ${((compressedFIleLength) / 1024).round()} Kb'),
                    ],
                  )
                : const Text('');
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File compressor'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ElevatedButton(
                      onPressed: () async {
                        if (await FilePickerService.getInstance()
                                .selectFiles(multiple: false) ==
                            true) {
                          setState(() {
                            file = FilePickerService.getInstance()
                                .getCachedFiles()
                                .first;
                            videoInfoFuture = imageInfoFuture = null;
                          });
                        }
                        ;
                      },
                      child: const Text('Select Image / Video')),
                ),
                file != null ? showMedia() : const Text(''),
                file != null ? showResult() : const Text('')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
