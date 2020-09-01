import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/Home.dart';
import '../Models/Productdetails.dart';
import '../Models/categories.dart';
import '../Models/ProductList.dart';
import '../Models/wishlist.dart';
import '../Models/searchmodel.dart';

const String mainUrl = "http://portal.mbj.in/api/";
const String mainCategories =
    "maincategories"; // to get the maincategories of homepage
const String banners = "banners"; // get the banners of homepage slider
const String featuredProducts =
    "products-featured/"; // get the featured products for homepage
const String productDetails = "products/";
const String categories = "categories/";
const String productlist = "categories/";
const String wishlist = "get-all-wishlist-products/";
const String requestcall = "send-call-request";
const String addwishlist = "add-product-to-wishlist";
const String removewishlist = mainUrl + "remove-product-from-wishlist";
const String searchproduct = mainUrl + "search-product?";

//// *********  Fetch main categories  **********/////

Future<Item> fetchMainCategories() async {
  final response = await http.get(mainUrl + mainCategories);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return Item.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

//// *********  Fetch banner  **********/////

Future<BannerItem> fetchBanners() async {
  final response = await http.get(mainUrl + banners);
  print(response.statusCode);
  print("bodyyyy=====>>>>");
  print(response.body);
  if (response.statusCode == 200) {
    return BannerItem.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future<ProductList> fetchFeaturedProducts(userid) async {
  final response =
      await http.get(mainUrl + featuredProducts + userid.toString());
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return ProductList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

///// @@@@@  categories list @@@@@@  ////

Future<Categories> fetchCategories(id, userid) async {
  print("userd" + userid.toString());
  print("id" + id.toString());
  print("category data");

  String url = mainUrl + categories + "$id/$userid";
  print(url);
  final response = await http.get(url);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return Categories.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

//// @@@@@@@  Product details @@@@@@@@@////

Future<ProductDetails> fetchProductdetails(id) async {
  final response = await http.get(mainUrl + productDetails + id);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return ProductDetails.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

/////  @@@@@  productlist  @@@@@@@@@ ///
Future<ProductList> fetchProductlist(id, userid) async {
  print("userd" + userid.toString());
  print("id" + id.toString());
  final response = await http.get(
      mainUrl + productlist + id.toString() + "/products/" + userid.toString());
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return ProductList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future<Wish> fetchWishlist(userid) async {
  final response = await http.get(mainUrl + wishlist + userid.toString());
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return Wish.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future requestCallback(userid, productid) async {
  print("Productid" + productid.toString());
  print("userid" + userid.toString());
  final response = await http.post(mainUrl + requestcall,
      body: {"user_id": userid.toString(), "product_id": productid.toString()});
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future addWish(userid, productid) async {
  print("Productid" + productid.toString());
  print("userid" + userid.toString());
  final response = await http.post(mainUrl + addwishlist,
      body: {"user_id": userid.toString(), "product_id": productid.toString()});
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future removeWish(userid, productid) async {
  print("Productid" + productid.toString());
  print("userid" + userid.toString());
  final response = await http.delete(
      removewishlist + "?user_id=" + userid + "&product_id=" + productid);
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load Categories');
  }
}

Future<Searchmodel> search(product, userid) async {
  final response = await http.get(searchproduct +
      "search_query=" +
      product +
      "&userId=" +
      userid.toString());

  if (response.statusCode == 200) {
    return Searchmodel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Categories');
  }
}
