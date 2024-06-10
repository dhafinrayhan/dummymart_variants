import 'package:dio/dio.dart';

import '../models/product.dart';

typedef ApiServiceException = DioException;
typedef ApiServiceResponse<T> = Response<T>;
typedef ApiServiceRequestOptions = RequestOptions;
typedef _ResponseData = Map<String, Object?>;

extension ApiServiceExceptionX on ApiServiceException {
  String? get responseMessage => response?.data?['message'] as String?;
}

/// An API client that makes network requests.
///
/// This class is meant to be seen as a representation of the common API contract
/// or API list (such as Swagger or Postman) given by the backend.
///
/// This class does not maintain authentication state, but rather receive the token
/// from external source.
///
/// When a widget or provider wants to make a network request, it should not
/// instantiate this class, but instead call the provider that exposes an object
/// of this type.
class ApiService {
  static final BaseOptions _defaultOptions = BaseOptions(
    baseUrl: 'https://dummyjson.com',
  );

  final Dio _httpClient;

  /// Creates an [ApiService] with default options.
  ApiService() : _httpClient = Dio(_defaultOptions);

  Future<List<Product>> fetchProducts() async {
    final response = await _httpClient.get('/products');

    return (response.data['products'] as List)
        .cast<_ResponseData>()
        .map(Product.fromJson)
        .toList();
  }

  Future<Product> fetchProduct(int id) async {
    final response = await _httpClient.get('/products/$id');

    return Product.fromJson(response.data as _ResponseData);
  }
}
