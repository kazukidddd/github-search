// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'query_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetQueryHistoryCollectionCollection on Isar {
  IsarCollection<QueryHistoryCollection> get queryHistoryCollections =>
      getCollection();
}

const QueryHistoryCollectionSchema = CollectionSchema(
  name: r'QueryHistoryCollection',
  schema:
      r'{"name":"QueryHistoryCollection","idName":"id","properties":[{"name":"queryString","type":"String"},{"name":"searchedAt","type":"Long"}],"indexes":[{"name":"searchedAt","unique":false,"replace":false,"properties":[{"name":"searchedAt","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: r'id',
  propertyIds: {r'queryString': 0, r'searchedAt': 1},
  listProperties: {},
  indexIds: {r'searchedAt': 0},
  indexValueTypes: {
    r'searchedAt': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _queryHistoryCollectionGetId,
  setId: _queryHistoryCollectionSetId,
  getLinks: _queryHistoryCollectionGetLinks,
  attachLinks: _queryHistoryCollectionAttachLinks,
  serializeNative: _queryHistoryCollectionSerializeNative,
  deserializeNative: _queryHistoryCollectionDeserializeNative,
  deserializePropNative: _queryHistoryCollectionDeserializePropNative,
  serializeWeb: _queryHistoryCollectionSerializeWeb,
  deserializeWeb: _queryHistoryCollectionDeserializeWeb,
  deserializePropWeb: _queryHistoryCollectionDeserializePropWeb,
  version: 4,
);

int? _queryHistoryCollectionGetId(QueryHistoryCollection object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _queryHistoryCollectionSetId(QueryHistoryCollection object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _queryHistoryCollectionGetLinks(
    QueryHistoryCollection object) {
  return [];
}

void _queryHistoryCollectionSerializeNative(
    IsarCollection<QueryHistoryCollection> collection,
    IsarCObject cObj,
    QueryHistoryCollection object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final queryString$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.queryString);
  final size = (staticSize + (queryString$Bytes.length)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeBytes(offsets[0], queryString$Bytes);
  writer.writeDateTime(offsets[1], object.searchedAt);
}

QueryHistoryCollection _queryHistoryCollectionDeserializeNative(
    IsarCollection<QueryHistoryCollection> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = QueryHistoryCollection();
  object.id = id;
  object.queryString = reader.readString(offsets[0]);
  object.searchedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _queryHistoryCollectionDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _queryHistoryCollectionSerializeWeb(
    IsarCollection<QueryHistoryCollection> collection,
    QueryHistoryCollection object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'queryString', object.queryString);
  IsarNative.jsObjectSet(
      jsObj, r'searchedAt', object.searchedAt.toUtc().millisecondsSinceEpoch);
  return jsObj;
}

QueryHistoryCollection _queryHistoryCollectionDeserializeWeb(
    IsarCollection<QueryHistoryCollection> collection, Object jsObj) {
  final object = QueryHistoryCollection();
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.queryString = IsarNative.jsObjectGet(jsObj, r'queryString') ?? '';
  object.searchedAt = IsarNative.jsObjectGet(jsObj, r'searchedAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, r'searchedAt') as int,
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  return object;
}

P _queryHistoryCollectionDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'queryString':
      return (IsarNative.jsObjectGet(jsObj, r'queryString') ?? '') as P;
    case r'searchedAt':
      return (IsarNative.jsObjectGet(jsObj, r'searchedAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, r'searchedAt') as int,
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _queryHistoryCollectionAttachLinks(
    IsarCollection<dynamic> col, int id, QueryHistoryCollection object) {}

extension QueryHistoryCollectionQueryWhereSort
    on QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QWhere> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterWhere>
      anySearchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'searchedAt'),
      );
    });
  }
}

extension QueryHistoryCollectionQueryWhere on QueryBuilder<
    QueryHistoryCollection, QueryHistoryCollection, QWhereClause> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> idNotEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> searchedAtEqualTo(DateTime searchedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'searchedAt',
        value: [searchedAt],
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> searchedAtNotEqualTo(DateTime searchedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchedAt',
              lower: [],
              upper: [searchedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchedAt',
              lower: [searchedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchedAt',
              lower: [searchedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'searchedAt',
              lower: [],
              upper: [searchedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> searchedAtGreaterThan(
    DateTime searchedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'searchedAt',
        lower: [searchedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> searchedAtLessThan(
    DateTime searchedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'searchedAt',
        lower: [],
        upper: [searchedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterWhereClause> searchedAtBetween(
    DateTime lowerSearchedAt,
    DateTime upperSearchedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'searchedAt',
        lower: [lowerSearchedAt],
        includeLower: includeLower,
        upper: [upperSearchedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QueryHistoryCollectionQueryFilter on QueryBuilder<
    QueryHistoryCollection, QueryHistoryCollection, QFilterCondition> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queryString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> queryStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
          QAfterFilterCondition>
      queryStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'queryString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
          QAfterFilterCondition>
      queryStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'queryString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> searchedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> searchedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'searchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> searchedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'searchedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection,
      QAfterFilterCondition> searchedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'searchedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QueryHistoryCollectionQueryLinks on QueryBuilder<
    QueryHistoryCollection, QueryHistoryCollection, QFilterCondition> {}

extension QueryHistoryCollectionQueryWhereSortBy
    on QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QSortBy> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      sortByQueryString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryString', Sort.asc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      sortByQueryStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryString', Sort.desc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      sortBySearchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchedAt', Sort.asc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      sortBySearchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchedAt', Sort.desc);
    });
  }
}

extension QueryHistoryCollectionQueryWhereSortThenBy on QueryBuilder<
    QueryHistoryCollection, QueryHistoryCollection, QSortThenBy> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenByQueryString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryString', Sort.asc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenByQueryStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'queryString', Sort.desc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenBySearchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchedAt', Sort.asc);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QAfterSortBy>
      thenBySearchedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchedAt', Sort.desc);
    });
  }
}

extension QueryHistoryCollectionQueryWhereDistinct
    on QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QDistinct> {
  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QDistinct>
      distinctByQueryString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queryString', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QueryHistoryCollection, QueryHistoryCollection, QDistinct>
      distinctBySearchedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchedAt');
    });
  }
}

extension QueryHistoryCollectionQueryProperty on QueryBuilder<
    QueryHistoryCollection, QueryHistoryCollection, QQueryProperty> {
  QueryBuilder<QueryHistoryCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QueryHistoryCollection, String, QQueryOperations>
      queryStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queryString');
    });
  }

  QueryBuilder<QueryHistoryCollection, DateTime, QQueryOperations>
      searchedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchedAt');
    });
  }
}
