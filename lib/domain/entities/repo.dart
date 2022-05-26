// Copyright 2022 susatthi All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_display/number_display.dart';

import '../../utils/extensions.dart';

part 'repo.freezed.dart';

/// リポジトリEntity
@freezed
class Repo with _$Repo {
  const factory Repo({
    /// オーナー名
    required String ownerName,

    /// アバターURL
    required String avatarUrl,

    /// オーナーURL
    required String? ownerUrl,

    /// リポジトリ名
    required String repoName,

    /// リポジトリ名（フル）
    required String fullName,

    /// 説明
    String? description,

    /// スター数
    required int stargazersCount,

    /// ウォッチャー数
    required int watchersCount,

    /// プロジェクト言語
    required RepoLanguage language,

    /// フォーク数
    required int forksCount,

    /// Issue数
    required int openIssuesCount,

    /// デフォルトブランチ
    required String defaultBranch,

    /// リポジトリURL
    String? repoUrl,

    /// スター数URL
    String? stargazersUrl,

    /// ウォッチャー数URL
    String? watchersUrl,

    /// フォーク数URL
    String? forksUrl,

    /// Issue数URL
    String? issuesUrl,
  }) = _Repo;
}

extension RepoHelper on Repo {
  /// 表示用のスター数（例：35432 => 35.4k）
  String get stargazersCountShort => _countDisplay(stargazersCount);

  /// 表示用のウォッチャー数（例：35432 => 35.4k）
  String get watchersCountShort => _countDisplay(watchersCount);

  /// 表示用のフォーク数（例：35432 => 35.4k）
  String get forksCountShort => _countDisplay(forksCount);

  /// 表示用のIssue数（例：35432 => 35.4k）
  String get openIssuesCountShort => _countDisplay(openIssuesCount);
}

/// 表示用のスター数の変換メソッド
final _countDisplay = createDisplay(
  length: 4,
);

/// プロジェクト言語ValueObject
class RepoLanguage extends Equatable {
  const RepoLanguage([this.language]);

  final String? language;

  @override
  List<Object?> get props => [language];

  /// プロジェクト言語のカラー
  Color get color {
    final hex = _languageHexes.entries
        .firstWhereOrNull((element) => element.key == language)
        ?.value;
    return HexColor(hex ?? '#999999');
  }

  /// プロジェクト言語毎のカラーリスト
  ///
  /// see: https://gist.github.com/robertpeteuil/bb2dc86f3b3e25d203664d61410bfa30
  static const _languageHexes = <String, String>{
    'ABAP': '#E8274B',
    'ActionScript': '#882B0F',
    'Ada': '#02f88c',
    'Agda': '#315665',
    'AGS Script': '#B9D9FF',
    'Alloy': '#64C800',
    'AMPL': '#E6EFBB',
    'ANTLR': '#9DC3FF',
    'API Blueprint': '#2ACCA8',
    'APL': '#5A8164',
    'Arc': '#aa2afe',
    'Arduino': '#bd79d1',
    'ASP': '#6a40fd',
    'AspectJ': '#a957b0',
    'Assembly': '#6E4C13',
    'ATS': '#1ac620',
    'AutoHotkey': '#6594b9',
    'AutoIt': '#1C3552',
    'BlitzMax': '#cd6400',
    'Boo': '#d4bec1',
    'Brainfuck': '#2F2530',
    'C Sharp': '#178600',
    'C': '#555555',
    'Chapel': '#8dc63f',
    'Cirru': '#ccccff',
    'Clarion': '#db901e',
    'Clean': '#3F85AF',
    'Click': '#E4E6F3',
    'Clojure': '#db5855',
    'CoffeeScript': '#244776',
    'ColdFusion CFC': '#ed2cd6',
    'ColdFusion': '#ed2cd6',
    'Common Lisp': '#3fb68b',
    'Component Pascal': '#b0ce4e',
    'cpp': '#f34b7d',
    'Crystal': '#776791',
    'CSS': '#563d7c',
    'D': '#ba595e',
    'Dart': '#00B4AB',
    'Diff': '#88dddd',
    'DM': '#447265',
    'Dogescript': '#cca760',
    'Dylan': '#6c616e',
    'E': '#ccce35',
    'Eagle': '#814C05',
    'eC': '#913960',
    'ECL': '#8a1267',
    'edn': '#db5855',
    'Eiffel': '#946d57',
    'Elixir': '#6e4a7e',
    'Elm': '#60B5CC',
    'Emacs Lisp': '#c065db',
    'EmberScript': '#FFF4F3',
    'Erlang': '#B83998',
    'F#': '#b845fc',
    'Factor': '#636746',
    'Fancy': '#7b9db4',
    'Fantom': '#dbded5',
    'FLUX': '#88ccff',
    'Forth': '#341708',
    'FORTRAN': '#4d41b1',
    'FreeMarker': '#0050b2',
    'Frege': '#00cafe',
    'Game Maker Language': '#8fb200',
    'Glyph': '#e4cc98',
    'Gnuplot': '#f0a9f0',
    'Go': '#375eab',
    'Golo': '#88562A',
    'Gosu': '#82937f',
    'Grammatical Framework': '#79aa7a',
    'Groovy': '#e69f56',
    'Handlebars': '#01a9d6',
    'Harbour': '#0e60e3',
    'Haskell': '#29b544',
    'Haxe': '#df7900',
    'HTML': '#e44b23',
    'Hy': '#7790B2',
    'IDL': '#a3522f',
    'Io': '#a9188d',
    'Ioke': '#078193',
    'Isabelle': '#FEFE00',
    'J': '#9EEDFF',
    'Java': '#b07219',
    'JavaScript': '#f1e05a',
    'JFlex': '#DBCA00',
    'JSONiq': '#40d47e',
    'Julia': '#a270ba',
    'Jupyter Notebook': '#DA5B0B',
    'Kotlin': '#F18E33',
    'KRL': '#28431f',
    'Lasso': '#999999',
    'Latte': '#A8FF97',
    'Lex': '#DBCA00',
    'LFE': '#004200',
    'LiveScript': '#499886',
    'LOLCODE': '#cc9900',
    'LookML': '#652B81',
    'LSL': '#3d9970',
    'Lua': '#000080',
    'Makefile': '#427819',
    'Mask': '#f97732',
    'Matlab': '#bb92ac',
    'Max': '#c4a79c',
    'MAXScript': '#00a6a6',
    'Mercury': '#ff2b2b',
    'Metal': '#8f14e9',
    'Mirah': '#c7a938',
    'MTML': '#b7e1f4',
    'NCL': '#28431f',
    'Nemerle': '#3d3c6e',
    'nesC': '#94B0C7',
    'NetLinx': '#0aa0ff',
    'NetLinx+ERB': '#747faa',
    'NetLogo': '#ff6375',
    'NewLisp': '#87AED7',
    'Nimrod': '#37775b',
    'Nit': '#009917',
    'Nix': '#7e7eff',
    'Nu': '#c9df40',
    'Objective-C': '#438eff',
    'Objective-C++': '#6866fb',
    'Objective-J': '#ff0c5a',
    'OCaml': '#3be133',
    'Omgrofl': '#cabbff',
    'ooc': '#b0b77e',
    'Opal': '#f7ede0',
    'Oxygene': '#cdd0e3',
    'Oz': '#fab738',
    'Pan': '#cc0000',
    'Papyrus': '#6600cc',
    'Parrot': '#f3ca0a',
    'Pascal': '#b0ce4e',
    'PAWN': '#dbb284',
    'Perl': '#0298c3',
    'Perl6': '#0000fb',
    'PHP': '#4F5D95',
    'PigLatin': '#fcd7de',
    'Pike': '#005390',
    'PLSQL': '#dad8d8',
    'PogoScript': '#d80074',
    'Processing': '#0096D8',
    'Prolog': '#74283c',
    'Propeller Spin': '#7fa2a7',
    'Puppet': '#302B6D',
    'Pure Data': '#91de79',
    'PureBasic': '#5a6986',
    'PureScript': '#1D222D',
    'Python': '#3572A5',
    'QML': '#44a51c',
    'R': '#198ce7',
    'Racket': '#22228f',
    'Ragel in Ruby Host': '#9d5200',
    'RAML': '#77d9fb',
    'Rebol': '#358a5b',
    'Red': '#ee0000',
    'Ren\'Py': '#ff7f7f',
    'Rouge': '#cc0088',
    'Ruby': '#701516',
    'Rust': '#dea584',
    'SaltStack': '#646464',
    'SAS': '#B34936',
    'Scala': '#DC322F',
    'Scheme': '#1e4aec',
    'Self': '#0579aa',
    'Shell': '#89e051',
    'Shen': '#120F14',
    'Slash': '#007eff',
    'Slim': '#ff8f77',
    'Smalltalk': '#596706',
    'SourcePawn': '#5c7611',
    'SQF': '#3F3F3F',
    'Squirrel': '#800000',
    'Stan': '#b2011d',
    'Standard ML': '#dc566d',
    'SuperCollider': '#46390b',
    'Swift': '#ffac45',
    'SystemVerilog': '#DAE1C2',
    'Tcl': '#e4cc98',
    'TeX': '#3D6117',
    'Turing': '#45f715',
    'TypeScript': '#2b7489',
    'Unified Parallel C': '#4e3617',
    'Unity3D Asset': '#ab69a1',
    'UnrealScript': '#a54c4d',
    'Vala': '#fbe5cd',
    'Verilog': '#b2b7f8',
    'VHDL': '#adb2cb',
    'VimL': '#199f4b',
    'Visual Basic': '#945db7',
    'Volt': '#1F1F1F',
    'Vue': '#2c3e50',
    'Web Ontology Language': '#9cc9dd',
    'wisp': '#7582D1',
    'X10': '#4B6BEF',
    'xBase': '#403a40',
    'XC': '#99DA07',
    'XQuery': '#5232e7',
    'Zephir': '#118f9e',
  };
}
