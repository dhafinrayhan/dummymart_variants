import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  final int id;
  const ProductView({Key? key, required this.id}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : viewModel.hasError
              ? const Center(child: Text('An error occurred'))
              : ListView(
                  children: [
                    ListTile(
                      title: const Text('Title'),
                      subtitle: Text(viewModel.product.title),
                    ),
                    ListTile(
                      title: const Text('Description'),
                      subtitle: Text(viewModel.product.description),
                    ),
                    if (viewModel.product.brand != null)
                      ListTile(
                        title: const Text('Brand'),
                        subtitle: Text(viewModel.product.brand!),
                      ),
                    ListTile(
                      title: const Text('Stock'),
                      subtitle: Text(viewModel.product.stock.toString()),
                    ),
                  ],
                ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();

  @override
  void onViewModelReady(ProductViewModel viewModel) {
    viewModel.fetchProduct(id);
  }
}
