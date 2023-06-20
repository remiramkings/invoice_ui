import 'package:ui_project/model/enquiry_model.dart';

import '../model/product.dart';
import 'base_service.dart';
import 'package:http/http.dart';

class ProductService extends BaseService {

  static ProductService _instance = new ProductService();

  static ProductService getInstance(){
    return _instance;
  }

  Future<List<ProductModel>> getProductData() async {
    Uri uri = getApiUri('api/GetEnquiryByID/28');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return [];
    }
    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey('products')){
      return [];
    }
    
    return (map['products'] as List<dynamic>)
      .map((e)=> ProductModel.fromMap(e as Map<String, dynamic>))
      .toList();

  }
  Future<Map<String, dynamic>> getEnquiryData() async {
    List<ProductModel> products = [];
    EnquiryModel? enquiry = null;
    
    Uri uri = getApiUri('api/GetEnquiryByID/28');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return {
      'products': products,
      'enquiry': enquiry
    };
    }
    Map<String, dynamic> map = getMap(response);
        
    if(map.containsKey('products')){
      products = (map['products'] as List<dynamic>)
      .map((e)=> ProductModel.fromMap(e as Map<String, dynamic>))
      .toList();
    }
    
    if(map.containsKey('enquiry')){
      enquiry = EnquiryModel.fromMap(map['enquiry'] as Map<String, dynamic>);
    }

    return {
      'products': products,
      'enquiry': enquiry
    };
  }
}