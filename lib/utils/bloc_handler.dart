import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../data/services/services.dart';
import '../data/repositories/repositories.dart';
import '../business_logic/blocs/blocs.dart';
import '../business_logic/cubits/cubits.dart';

class BlocHandler {
  final List<RepositoryProvider> repositoryProviders = [
    RepositoryProvider<ProductRepository>(
      create: (ctx) => ProductRepository(
        productService: ProductService(
          firestore: FirebaseFirestore.instance,
          storage: FirebaseStorage.instance,
        ),
      ),
    ),
  ];

  final List<BlocProvider> blocProviders = [
    BlocProvider<ProductListBloc>(
      create: (ctx) => ProductListBloc(
        productRepository: ctx.read<ProductRepository>(),
      )..add(ProductListStarted()),
    ),
    BlocProvider<ThemeCubit>(
      create: (ctx) => ThemeCubit(),
    ),
  ];
}
