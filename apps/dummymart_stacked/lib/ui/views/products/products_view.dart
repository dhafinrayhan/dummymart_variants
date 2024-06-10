import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'products_viewmodel.dart';

class ProductsView extends StackedView<ProductsViewModel> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? const Center(child: Text('An error occurred'))
              : ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (_, index) {
                    final product = viewModel.products[index];
                    return ListTile(
                      onTap: () {},
                      title: Text(product.title),
                      subtitle:
                          product.brand != null ? Text(product.brand!) : null,
                    );
                  },
                ),
    );
  }

  @override
  ProductsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductsViewModel();

  @override
  void onViewModelReady(ProductsViewModel viewModel) {
    viewModel.fetchProducts();
  }
}
