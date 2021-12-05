import 'package:agility_app/Data/Models/home_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class HomeRepository {
  Future<List<FirebaseFile>> listAll(String path);
}

class HomeSliderRepository implements HomeRepository {
  @override
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  @override
  Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();

    final urls = await _getDownloadLinks(result.items);
    // ignore: avoid_print

    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final length = result.items.length;
          final file = FirebaseFile(
              ref: ref,
              name: name,
              url: url,
              index: result.items.indexOf(ref),
              length: length);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}
