import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as processor;
import 'package:image_picker/image_picker.dart';
import 'package:my_hidden_photo/Data/temp_path.dart';

class ImageProcessor {
  /// Returns the decoded image of the provided file.
  ///
  /// - advance : the argument passed is the decoding progress between 0 and 1.
  Future<Image> decodeImage(PickedFile file, int bitsToUse) async {
    final data = await file.readAsBytes();
    late processor.Image decodedImg;
    try {
      decodedImg = processor.JpegDecoder().decodeImage(data)!;
    } catch (e) {
      decodedImg = processor.PngDecoder().decodeImage(data)!;
    }
    final decodedBytes = decodedImg.getBytes(format: processor.Format.rgb);
    List<int> outputList = [];
    decodedBytes.forEach((element) {
      final string = element.toRadixString(2).padLeft(8, "0");
      final newValue = string.substring(8 - bitsToUse);
      outputList.add(int.parse(newValue, radix: 2) * pow(2, 8 - bitsToUse).toInt());
    });

    final outputJpgEncoded = processor.encodePng(
        processor.Image.fromBytes(decodedImg.width, decodedImg.height, outputList, format: processor.Format.rgb));
    print("Saving image to ${await tempPath}");
    await (await File(await tempPath).create(recursive: true)).writeAsBytes(outputJpgEncoded);
    return Image.memory(Uint8List.fromList(outputJpgEncoded));
  }

  List<processor.Image> resizeImage(processor.Image hiddenImage, processor.Image hostImage, int maxSideLength) {
    final hostResize = min(maxSideLength / hostImage.width, maxSideLength / hostImage.height);
    if (hostResize < 1) {
      hostImage = processor.copyResize(hostImage,
          height: (hostImage.height * hostResize).floor(), width: (hostImage.width * hostResize).floor());
    }

    final heightRatio = hostImage.height / hiddenImage.height;
    final widthRatio = hostImage.width / hiddenImage.width;
    final resizeRatio = min(heightRatio, widthRatio);

    if (resizeRatio < 1) {
      return [
        processor.copyResize(hiddenImage,
            height: (hiddenImage.height * resizeRatio).floor(), width: (hiddenImage.width * resizeRatio).floor()),
        hostImage
      ];
    }
    return [hiddenImage, hostImage];
  }

  Future<Image> encodeImage(PickedFile hiddenImage, PickedFile hostImage, int bitsToUse, int maxSideLength) async {
    final dataHidden = await hiddenImage.readAsBytes();
    final dataHost = await hostImage.readAsBytes();

    late processor.Image decodedHidden;
    try {
      decodedHidden = processor.JpegDecoder().decodeImage(dataHidden)!;
    } catch (e) {
      decodedHidden = processor.PngDecoder().decodeImage(dataHidden)!;
    }
    late processor.Image decodedHost;
    try {
      decodedHost = processor.JpegDecoder().decodeImage(dataHost)!;
    } catch (e) {
      decodedHost = processor.PngDecoder().decodeImage(dataHost)!;
    }

    final output = resizeImage(decodedHidden, decodedHost, maxSideLength);
    decodedHidden = output[0];
    decodedHost = output[1];

    final decodedBytesHidden = decodedHidden.getBytes(format: processor.Format.rgb);
    final decodedBytesHost = decodedHost.getBytes(format: processor.Format.rgb);

    List<int> outputList = [];
    for (var y = 0; y < decodedHost.height; y++) {
      for (var x = 0; x < decodedHost.width * 3; x++) {
        final index = decodedHost.width * y * 3 + x;
        final hostString = decodedBytesHost[index].toRadixString(2).padLeft(8, '0');

        String partFromHidden = "0" * bitsToUse;
        if (y < decodedHidden.height && x < decodedHidden.width * 3) {
          partFromHidden = (decodedBytesHidden[y * decodedHidden.width * 3 + x] ~/ pow(2, 8 - bitsToUse))
              .toRadixString(2)
              .padLeft(8, '0')
              .substring(8 - bitsToUse);
        }
        final newValue = hostString.substring(0, 8 - bitsToUse) + partFromHidden;
        outputList.add(int.parse(newValue, radix: 2));
      }
    }
    final outputJpgEncoded = processor.encodePng(
        processor.Image.fromBytes(decodedHost.width, decodedHost.height, outputList, format: processor.Format.rgb));
    print("Saving image to $tempPath");
    await (await File(await tempPath).create(recursive: true)).writeAsBytes(outputJpgEncoded);
    return Image.memory(Uint8List.fromList(outputJpgEncoded));
  }
}
