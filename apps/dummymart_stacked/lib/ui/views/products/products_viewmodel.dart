import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/product.dart';
import '../../../services/api_service.dart';

class ProductsViewModel extends FutureViewModel<List<Product>> {
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Product>> futureToRun() => _apiService.fetchProducts();

  void viewProduct(int id) {
    _navigationService.navigateToProductView(id: id);
  }
}
