import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/product.dart';
import '../../../services/api_service.dart';

class ProductsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  late List<Product> _products;
  List<Product> get products => _products;

  Future<void> fetchProducts() {
    return runBusyFuture(_apiService.fetchProducts().then((products) {
      _products = products;
    }));
  }
}
