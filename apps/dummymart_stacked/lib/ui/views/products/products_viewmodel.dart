import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/product.dart';
import '../../../services/api_service.dart';

class ProductsViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  late List<Product> _products;
  List<Product> get products => _products;

  Future<void> fetchProducts() {
    return runBusyFuture(_apiService.fetchProducts().then((products) {
      _products = products;
    }));
  }

  void viewProduct(int id) {
    _navigationService.navigateToProductView(id: id);
  }
}
