class HomeResponseModel {
  String? status;
  String? message;
  int? code;
  Response? response;

  HomeResponseModel({this.status, this.message, this.code, this.response});

  HomeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    code = json['Code'];
    response = json['Response'] != null
        ? new Response.fromJson(json['Response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['Code'] = this.code;
    if (this.response != null) {
      data['Response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  List<Product>? product;

  Response({this.product});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['Product'] != null) {
      product = <Product>[];
      json['Product'].forEach((v) {
        product!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['Product'] = this.product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? name;
  ImageUrls? imageUrls;
  String? cost;
  String? category;
  String? productType;
  Sizes? sizes;

  Product(
      {this.name,
        this.imageUrls,
        this.cost,
        this.category,
        this.productType,
        this.sizes});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrls = json['imageUrls'] != null
        ? new ImageUrls.fromJson(json['imageUrls'])
        : null;
    cost = json['cost'];
    category = json['category'];
    productType = json['productType'];
    sizes = json['sizes'] != null ? new Sizes.fromJson(json['sizes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.imageUrls != null) {
      data['imageUrls'] = this.imageUrls!.toJson();
    }
    data['cost'] = this.cost;
    data['category'] = this.category;
    data['productType'] = this.productType;
    if (this.sizes != null) {
      data['sizes'] = this.sizes!.toJson();
    }
    return data;
  }
}

class ImageUrls {
  String? front;
  String? back;
  String? side;
  String? top;

  ImageUrls({this.front, this.back, this.side, this.top});

  ImageUrls.fromJson(Map<String, dynamic> json) {
    front = json['front'];
    back = json['back'];
    side = json['side'];
    top = json['top'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front'] = this.front;
    data['back'] = this.back;
    data['side'] = this.side;
    data['top'] = this.top;
    return data;
  }
}

class Sizes {
  String? small;
  String? medium;
  String? large;
  String? extraLarge;
  String? extraSmall;

  Sizes(
      {this.small, this.medium, this.large, this.extraLarge, this.extraSmall});

  Sizes.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    extraLarge = json['extraLarge'];
    extraSmall = json['extraSmall'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['extraLarge'] = this.extraLarge;
    data['extraSmall'] = this.extraSmall;
    return data;
  }
}
