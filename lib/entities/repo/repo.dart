// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:freezed_annotation/freezed_annotation.dart';

import '../owner/owner.dart';

part 'repo.freezed.dart';
part 'repo.g.dart';

/// リポジトリEntity
@freezed
class Repo with _$Repo {
  const factory Repo({
    required String name,
    @JsonKey(name: 'full_name') required String fullName,
    required Owner owner,
    required String? description,
    @JsonKey(name: 'stargazers_count') required int stargazersCount,
    @JsonKey(name: 'watchers_count') required int watchersCount,
    String? language,
    @JsonKey(name: 'forks_count') required int forksCount,
    @JsonKey(name: 'open_issues_count') required int openIssuesCount,
  }) = _Repo;
  const Repo._();

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  /// リポジトリURL
  String get repoUrl => '${owner.ownerUrl}/$name';

  /// スター数URL
  String get stargazersUrl => '$repoUrl/stargazers';

  /// ウォッチャー数URL
  String get watchersUrl => '$repoUrl/watchers';

  /// フォーク数URL
  String get forksUrl => '$repoUrl/network/members';

  /// Issue数URL
  String get issuesUrl => '$repoUrl/issues';
}
