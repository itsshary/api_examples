class Attributes {
  double? height;
  int? best;
  int? fiftyies;
  Attributes(
      {required this.height, required this.best, required this.fiftyies});
  factory Attributes.fromjson(Map<String, dynamic> parsedjson) {
    return Attributes(
        height: parsedjson['height'],
        best: parsedjson['best'],
        fiftyies: parsedjson['fiftyies']);
  }
}

class Images {
  String? imagename;
  int? id;
  Images({required this.id, required this.imagename});
  factory Images.fromjson(Map<String, dynamic> parsedjson) {
    return Images(id: parsedjson['id'], imagename: parsedjson['imagename']);
  }
}

class CricketModel {
  String? name;
  String? address;
  String? Location;
  List<dynamic> playerid;
  List<Images?> images;
  Attributes attributes;
  CricketModel({
    required this.name,
    required this.address,
    required this.Location,
    required this.playerid,
    required this.attributes,
    required this.images,
  });

  factory CricketModel.fromjson(Map<String, dynamic> jsonparsed) {
    List<Map<String, dynamic>> list = jsonparsed['images'];
    List<Images> listimages = list.map((e) => Images.fromjson(e)).toList();
    return CricketModel(
        name: jsonparsed['name'],
        address: jsonparsed['address'],
        Location: jsonparsed['Location'],
        playerid: jsonparsed['playerid'],
        images: listimages,
        attributes: Attributes.fromjson(jsonparsed['attributes']));
  }
}
