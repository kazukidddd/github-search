// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../localizations/strings.g.dart';
import '../../../utils/logger.dart';
import 'repo_search_repos_query.dart';

/// リポジトリ検索用テキストフィールド
class RepoSearchTextField extends ConsumerStatefulWidget {
  const RepoSearchTextField({
    Key? key,
    this.readOnly = false,
    this.prefixIcon,
    this.onTap,
    this.onTappedDelete,
    this.controller,
  }) : super(key: key);

  /// trueにすると読み取り専用になる
  final bool readOnly;

  /// TextFieldの先頭にアイコンを表示する
  final Widget? prefixIcon;

  /// TextFieldをタップしたときのイベント
  final GestureTapCallback? onTap;

  /// 削除ボタンをタップしたあとのイベント
  final GestureTapCallback? onTappedDelete;

  /// TextEditingController
  final TextEditingController? controller;

  @override
  ConsumerState<RepoSearchTextField> createState() =>
      _RepoSearchTextFieldState();
}

class _RepoSearchTextFieldState extends ConsumerState<RepoSearchTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.text = ref.read(repoSearchReposQueryProvider);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 検索文字列はアプリ内で1であるため、別で検索文字列が更新されたら同期する
    ref.listen(repoSearchReposQueryProvider, (previous, next) {
      logger.i(
        'Update query: current = ${_controller.text}, '
        'next = ${next.toString()}',
      );
      _controller.text = next.toString();
    });

    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: i18n.searchRepos,
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: widget.prefixIcon,
        // 1文字以上あるときだけ削除アイコンを表示する
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (_, value, __) {
            logger.i('Update delete icon: visible = ${value.text.isNotEmpty}');
            return Visibility(
              visible: value.text.isNotEmpty,
              child: InkWell(
                onTap: () {
                  // 検索文字列をクリアする
                  _controller.clear();
                  widget.onTappedDelete?.call();
                },
                child: Icon(
                  Icons.close,
                  color: IconTheme.of(context).color,
                ),
              ),
            );
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      // キーボードのEnterキー押下時に検索を実行する
      onSubmitted: (text) {
        ref.read(repoSearchReposQueryProvider.notifier).query = text;
        Navigator.of(context).pop();
      },
      // キーボードのEnterキーを検索ボタンにする
      textInputAction: TextInputAction.search,
      // trueにすると画面表示時に自動でキーボードを出してくれる
      autofocus: true,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
    );
  }
}
