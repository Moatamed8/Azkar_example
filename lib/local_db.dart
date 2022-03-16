/*
import 'dart:async';
import 'dart:convert';


class LocalDB {
  static Future<void> toggleFavourite(Hades hades) async {
    final id = hades.id.toString();
    if (isFavourite(id)) {
      await Hive.box(HADES_FAVORITE).delete(id);
    } else {
      await Hive.box(HADES_FAVORITE).put(id, json.encode(hades.toMap()));
    }
  }

  static Future<List<Hades>> getFavourites() async {
    var keys = Hive.box(HADES_FAVORITE).keys;
    List<Hades> hades = [];
    for (var item in keys) {
      hades.add(Hades.fromMap(json.decode(Hive.box(HADES_FAVORITE).get(item))));
    }
    return hades;
  }

  static bool isFavourite(String id) =>
      Hive.box(HADES_FAVORITE).containsKey(id);

////////////////////////////////////////////
  static Future<void> toggleBabFavourite(Bab bab) async {
    final id = bab.id.toString();
    if (isBabFavourite(id)) {
      await Hive.box(Bab_FAVORITE).delete(id);
    } else {
      await Hive.box(Bab_FAVORITE).put(id, json.encode(bab.toMap()));
    }
  }

  static Future<List<Bab>> getBabFavourites() async {
    var keys = Hive.box(Bab_FAVORITE).keys;
    List<Bab> babs = [];
    for (var item in keys) {
      babs.add(Bab.fromMap(json.decode(Hive.box(Bab_FAVORITE).get(item))));
    }
    return babs;
  }

  static bool isBabFavourite(String id) =>
      Hive.box(Bab_FAVORITE).containsKey(id);


  static Future<List<Note>> getNotes() async {
    var keys = Hive.box(NOTES).keys;
    List<Note> hades = [];
    for (var item in keys) {
      hades.add(Note.fromMap(json.decode(Hive.box(NOTES).get(item))));
    }
    return hades;
  }
}
*/
