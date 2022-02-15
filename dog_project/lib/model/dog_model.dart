import 'dart:io';
import 'package:http/http.dart' as http;

class DogModel {
  Weight? weight;
  Weight? height;
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;
  Image? image;

  DogModel(
      {this.weight,
      this.height,
      this.id,
      this.name,
      this.bredFor,
      this.breedGroup,
      this.lifeSpan,
      this.temperament,
      this.origin,
      this.referenceImageId,
      this.image});

  DogModel.fromJson(Map<String, dynamic> json) {
    weight = json['weight'] != null ? Weight.fromJson(json['weight']) : null;
    height = json['height'] != null ? Weight.fromJson(json['height']) : null;
    id = json['id'];
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (weight != null) {
      data['weight'] = weight!.toJson();
    }
    if (height != null) {
      data['height'] = height!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['bred_for'] = bredFor;
    data['breed_group'] = breedGroup;
    data['life_span'] = lifeSpan;
    data['temperament'] = temperament;
    data['origin'] = origin;
    data['reference_image_id'] = referenceImageId;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Weight {
  String? imperial;
  String? metric;

  Weight({this.imperial, this.metric});

  Weight.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imperial'] = imperial;
    data['metric'] = metric;
    return data;
  }
}

class Image {
  String? id;
  int? width;
  int? height;
  String? url;

  Image({this.id, this.width, this.height, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}
