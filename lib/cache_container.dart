import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';


class CacheContainer {
  final cacheManager = DefaultCacheManager();

  Future<File> downloadModel() async {
  const String url = 'assets/models/glass2.glb';

  final bytes = await rootBundle.load('assets/models/glass2.glb');
  final buffer = bytes.buffer;

  final Uint8List modelData = buffer.asUint8List();

  final file = await cacheManager.putFile(url, modelData, fileExtension: 'glb');
  return file;
}

  Future<File>? loadCachedModel() async {
  try {
    final file = await cacheManager.getSingleFile(
      'assets/models/glass2.glb',
    );
    return file;
  } catch (e) {
      print('Error getting cached model: $e');
    }
  return await downloadModel();
  } 

}

