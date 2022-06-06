// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/repositories/app_data/app_data_repository.dart';
import '../../../../domain/repositories/repo/entities/search_repos_order.dart';

/// リポジトリ検索用オーダー値プロバイダー
final searchReposOrderProvider = StateProvider<SearchReposOrder>(
  (ref) {
    final appDataRepository = ref.read(appDataRepositoryProvider);
    return appDataRepository.getSearchReposOrder();
  },
);

/// リポジトリ検索用オーダー値更新メソッドプロバイダー
final searchReposOrderUpdater = Provider(
  (ref) {
    final notifier = ref.read(searchReposOrderProvider.notifier);
    final appDataRepository = ref.read(appDataRepositoryProvider);
    return (SearchReposOrder order) {
      appDataRepository.setSearchReposOrder(order);
      notifier.state = appDataRepository.getSearchReposOrder();
    };
  },
);
