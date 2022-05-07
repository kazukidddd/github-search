// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../entities/repo/repo_data.dart';
import '../../../utils/logger.dart';
import '../../pages/repo/repo_view_page.dart';
import '../common/async_value_handler.dart';
import '../common/cached_circle_avatar.dart';
import 'repo_list_view_notifier.dart';
import 'repo_list_view_state.dart';

/// リポジトリ一覧View
class RepoListView extends ConsumerWidget {
  const RepoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(repoListViewStateProvider);
    return AsyncValueHandler<RepoListViewState>(
      value: asyncValue,
      builder: (state) => _RepoListView(state: state),
    );
  }
}

class _RepoListView extends StatelessWidget {
  const _RepoListView({
    Key? key,
    required this.state,
  }) : super(key: key);

  final RepoListViewState state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.items.length + (state.hasNext ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < state.items.length) {
          return _RepoListTile(
            data: state.items[index],
          );
        }
        return const _CircularProgressListTile();
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}

/// リポジトリListTile
class _RepoListTile extends StatelessWidget {
  const _RepoListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  /// UI用リポジトリEntity
  final RepoData data;

  @override
  Widget build(BuildContext context) {
    final description = data.description;
    return ListTile(
      leading: CachedCircleAvatar(
        url: data.owner.avatarUrl,
        size: 40,
        loading: false,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.fullName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (description != null)
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
        ],
      ),
      subtitle: Row(
        children: [
          SizedBox(
            width: 64,
            child: _StargazersCountLabel(
              text: data.stargazersCountShort,
            ),
          ),
          const SizedBox(width: 10),
          _LanguageLabel(
            color: data.languageColor,
            language: data.language,
          ),
        ],
      ),
      onTap: () {
        // リポジトリ詳細画面に遷移する
        context.goNamed(
          RepoViewPage.name,
          params: RepoViewPage.params(
            ownerName: data.owner.name,
            repoName: data.name,
          ),
        );
      },
    );
  }
}

/// スター数のアイコン＋ラベル
class _StargazersCountLabel extends StatelessWidget {
  const _StargazersCountLabel({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star_outline,
          color: Theme.of(context).textTheme.caption!.color,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(text),
        const Spacer(),
      ],
    );
  }
}

/// プロジェクト言語のカラー＋ラベル
class _LanguageLabel extends StatelessWidget {
  const _LanguageLabel({
    Key? key,
    required this.color,
    this.language,
  }) : super(key: key);

  final Color color;
  final String? language;

  @override
  Widget build(BuildContext context) {
    if (language == null) {
      return const SizedBox();
    }

    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(language!),
      ],
    );
  }
}

/// リストビューを一番下までスクロールしたときに表示するプログレス
class _CircularProgressListTile extends ConsumerWidget {
  const _CircularProgressListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VisibilityDetector(
      key: const Key('for detect visibility'),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
      onVisibilityChanged: (info) async {
        if (info.visibleFraction > 0.1) {
          logger.i('appeared progress: info=$info');
          // 表示されたので次のページを取得する
          await ref.read(repoListViewStateProvider.notifier).fetchNextPage();
        }
      },
    );
  }
}
