// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaperCollection on Isar {
  IsarCollection<Paper> get papers => this.collection();
}

const PaperSchema = CollectionSchema(
  name: r'Paper',
  id: -5851686976264278198,
  properties: {
    r'createdTime': PropertySchema(
      id: 0,
      name: r'createdTime',
      type: IsarType.dateTime,
    ),
    r'goldNumber': PropertySchema(
      id: 1,
      name: r'goldNumber',
      type: IsarType.long,
    ),
    r'grade': PropertySchema(
      id: 2,
      name: r'grade',
      type: IsarType.long,
    ),
    r'hearingFile': PropertySchema(
      id: 3,
      name: r'hearingFile',
      type: IsarType.string,
    ),
    r'hearingTime': PropertySchema(
      id: 4,
      name: r'hearingTime',
      type: IsarType.long,
    ),
    r'isFinish': PropertySchema(
      id: 5,
      name: r'isFinish',
      type: IsarType.bool,
    ),
    r'isLock': PropertySchema(
      id: 6,
      name: r'isLock',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'paperId': PropertySchema(
      id: 8,
      name: r'paperId',
      type: IsarType.long,
    ),
    r'score': PropertySchema(
      id: 9,
      name: r'score',
      type: IsarType.long,
    ),
    r'sort': PropertySchema(
      id: 10,
      name: r'sort',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 11,
      name: r'status',
      type: IsarType.byte,
      enumMap: _PaperstatusEnumValueMap,
    ),
    r'testScore': PropertySchema(
      id: 12,
      name: r'testScore',
      type: IsarType.long,
    ),
    r'time': PropertySchema(
      id: 13,
      name: r'time',
      type: IsarType.long,
    ),
    r'updatedTime': PropertySchema(
      id: 14,
      name: r'updatedTime',
      type: IsarType.dateTime,
    ),
    r'year': PropertySchema(
      id: 15,
      name: r'year',
      type: IsarType.string,
    )
  },
  estimateSize: _paperEstimateSize,
  serialize: _paperSerialize,
  deserialize: _paperDeserialize,
  deserializeProp: _paperDeserializeProp,
  idName: r'id',
  indexes: {
    r'paperId': IndexSchema(
      id: -7152058561277781812,
      name: r'paperId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'paperId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _paperGetId,
  getLinks: _paperGetLinks,
  attach: _paperAttach,
  version: '3.1.0+1',
);

int _paperEstimateSize(
  Paper object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hearingFile;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.year;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paperSerialize(
  Paper object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdTime);
  writer.writeLong(offsets[1], object.goldNumber);
  writer.writeLong(offsets[2], object.grade);
  writer.writeString(offsets[3], object.hearingFile);
  writer.writeLong(offsets[4], object.hearingTime);
  writer.writeBool(offsets[5], object.isFinish);
  writer.writeBool(offsets[6], object.isLock);
  writer.writeString(offsets[7], object.name);
  writer.writeLong(offsets[8], object.paperId);
  writer.writeLong(offsets[9], object.score);
  writer.writeLong(offsets[10], object.sort);
  writer.writeByte(offsets[11], object.status.index);
  writer.writeLong(offsets[12], object.testScore);
  writer.writeLong(offsets[13], object.time);
  writer.writeDateTime(offsets[14], object.updatedTime);
  writer.writeString(offsets[15], object.year);
}

Paper _paperDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Paper();
  object.createdTime = reader.readDateTimeOrNull(offsets[0]);
  object.goldNumber = reader.readLong(offsets[1]);
  object.grade = reader.readLong(offsets[2]);
  object.hearingFile = reader.readStringOrNull(offsets[3]);
  object.hearingTime = reader.readLongOrNull(offsets[4]);
  object.id = id;
  object.isFinish = reader.readBool(offsets[5]);
  object.isLock = reader.readBool(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.paperId = reader.readLong(offsets[8]);
  object.score = reader.readLongOrNull(offsets[9]);
  object.sort = reader.readLongOrNull(offsets[10]);
  object.status =
      _PaperstatusValueEnumMap[reader.readByteOrNull(offsets[11])] ??
          PaperStatus.draft;
  object.testScore = reader.readLongOrNull(offsets[12]);
  object.time = reader.readLongOrNull(offsets[13]);
  object.updatedTime = reader.readDateTimeOrNull(offsets[14]);
  object.year = reader.readStringOrNull(offsets[15]);
  return object;
}

P _paperDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (_PaperstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          PaperStatus.draft) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PaperstatusEnumValueMap = {
  'draft': 0,
  'published': 1,
  'archived': 2,
  'active': 3,
};
const _PaperstatusValueEnumMap = {
  0: PaperStatus.draft,
  1: PaperStatus.published,
  2: PaperStatus.archived,
  3: PaperStatus.active,
};

Id _paperGetId(Paper object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paperGetLinks(Paper object) {
  return [];
}

void _paperAttach(IsarCollection<dynamic> col, Id id, Paper object) {
  object.id = id;
}

extension PaperByIndex on IsarCollection<Paper> {
  Future<Paper?> getByPaperId(int paperId) {
    return getByIndex(r'paperId', [paperId]);
  }

  Paper? getByPaperIdSync(int paperId) {
    return getByIndexSync(r'paperId', [paperId]);
  }

  Future<bool> deleteByPaperId(int paperId) {
    return deleteByIndex(r'paperId', [paperId]);
  }

  bool deleteByPaperIdSync(int paperId) {
    return deleteByIndexSync(r'paperId', [paperId]);
  }

  Future<List<Paper?>> getAllByPaperId(List<int> paperIdValues) {
    final values = paperIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'paperId', values);
  }

  List<Paper?> getAllByPaperIdSync(List<int> paperIdValues) {
    final values = paperIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'paperId', values);
  }

  Future<int> deleteAllByPaperId(List<int> paperIdValues) {
    final values = paperIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'paperId', values);
  }

  int deleteAllByPaperIdSync(List<int> paperIdValues) {
    final values = paperIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'paperId', values);
  }

  Future<Id> putByPaperId(Paper object) {
    return putByIndex(r'paperId', object);
  }

  Id putByPaperIdSync(Paper object, {bool saveLinks = true}) {
    return putByIndexSync(r'paperId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPaperId(List<Paper> objects) {
    return putAllByIndex(r'paperId', objects);
  }

  List<Id> putAllByPaperIdSync(List<Paper> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'paperId', objects, saveLinks: saveLinks);
  }

  Future<Paper?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  Paper? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<Paper?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<Paper?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(Paper object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(Paper object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<Paper> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<Paper> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension PaperQueryWhereSort on QueryBuilder<Paper, Paper, QWhere> {
  QueryBuilder<Paper, Paper, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhere> anyPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'paperId'),
      );
    });
  }
}

extension PaperQueryWhere on QueryBuilder<Paper, Paper, QWhereClause> {
  QueryBuilder<Paper, Paper, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Paper, Paper, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
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

  QueryBuilder<Paper, Paper, QAfterWhereClause> paperIdEqualTo(int paperId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'paperId',
        value: [paperId],
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> paperIdNotEqualTo(int paperId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paperId',
              lower: [],
              upper: [paperId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paperId',
              lower: [paperId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paperId',
              lower: [paperId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'paperId',
              lower: [],
              upper: [paperId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> paperIdGreaterThan(
    int paperId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paperId',
        lower: [paperId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> paperIdLessThan(
    int paperId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paperId',
        lower: [],
        upper: [paperId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> paperIdBetween(
    int lowerPaperId,
    int upperPaperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'paperId',
        lower: [lowerPaperId],
        includeLower: includeLower,
        upper: [upperPaperId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PaperQueryFilter on QueryBuilder<Paper, Paper, QFilterCondition> {
  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> createdTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> goldNumberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'goldNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> goldNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'goldNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> goldNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'goldNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> goldNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'goldNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> gradeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> gradeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> gradeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> gradeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hearingFile',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hearingFile',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hearingFile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hearingFile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearingFile',
        value: '',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingFileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hearingFile',
        value: '',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hearingTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hearingTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hearingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hearingTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> hearingTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hearingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<Paper, Paper, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<Paper, Paper, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<Paper, Paper, QAfterFilterCondition> isFinishEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFinish',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> isLockEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLock',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> paperIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> paperIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> paperIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> paperIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paperId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> scoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> sortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> statusEqualTo(
      PaperStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> statusGreaterThan(
    PaperStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> statusLessThan(
    PaperStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> statusBetween(
    PaperStatus lower,
    PaperStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'testScore',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'testScore',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'testScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'testScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'testScore',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> testScoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'testScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'time',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'time',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> timeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'time',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> updatedTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'year',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<Paper, Paper, QAfterFilterCondition> yearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'year',
        value: '',
      ));
    });
  }
}

extension PaperQueryObject on QueryBuilder<Paper, Paper, QFilterCondition> {}

extension PaperQueryLinks on QueryBuilder<Paper, Paper, QFilterCondition> {}

extension PaperQuerySortBy on QueryBuilder<Paper, Paper, QSortBy> {
  QueryBuilder<Paper, Paper, QAfterSortBy> sortByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByGoldNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goldNumber', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByGoldNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goldNumber', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByHearingFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByHearingFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByHearingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByHearingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByIsFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinish', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByIsFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinish', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLock', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLock', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByTestScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testScore', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByTestScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testScore', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PaperQuerySortThenBy on QueryBuilder<Paper, Paper, QSortThenBy> {
  QueryBuilder<Paper, Paper, QAfterSortBy> thenByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByGoldNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goldNumber', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByGoldNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'goldNumber', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByHearingFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByHearingFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByHearingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByHearingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByIsFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinish', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByIsFinishDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFinish', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLock', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByIsLockDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLock', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByTestScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testScore', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByTestScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'testScore', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'time', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<Paper, Paper, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }
}

extension PaperQueryWhereDistinct on QueryBuilder<Paper, Paper, QDistinct> {
  QueryBuilder<Paper, Paper, QDistinct> distinctByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdTime');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByGoldNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'goldNumber');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByHearingFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hearingFile', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByHearingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hearingTime');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByIsFinish() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFinish');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByIsLock() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLock');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paperId');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByTestScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'testScore');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'time');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedTime');
    });
  }

  QueryBuilder<Paper, Paper, QDistinct> distinctByYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year', caseSensitive: caseSensitive);
    });
  }
}

extension PaperQueryProperty on QueryBuilder<Paper, Paper, QQueryProperty> {
  QueryBuilder<Paper, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Paper, DateTime?, QQueryOperations> createdTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdTime');
    });
  }

  QueryBuilder<Paper, int, QQueryOperations> goldNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'goldNumber');
    });
  }

  QueryBuilder<Paper, int, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Paper, String?, QQueryOperations> hearingFileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hearingFile');
    });
  }

  QueryBuilder<Paper, int?, QQueryOperations> hearingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hearingTime');
    });
  }

  QueryBuilder<Paper, bool, QQueryOperations> isFinishProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFinish');
    });
  }

  QueryBuilder<Paper, bool, QQueryOperations> isLockProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLock');
    });
  }

  QueryBuilder<Paper, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Paper, int, QQueryOperations> paperIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paperId');
    });
  }

  QueryBuilder<Paper, int?, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<Paper, int?, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }

  QueryBuilder<Paper, PaperStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Paper, int?, QQueryOperations> testScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'testScore');
    });
  }

  QueryBuilder<Paper, int?, QQueryOperations> timeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'time');
    });
  }

  QueryBuilder<Paper, DateTime?, QQueryOperations> updatedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedTime');
    });
  }

  QueryBuilder<Paper, String?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBigQuestionCollection on Isar {
  IsarCollection<BigQuestion> get bigQuestions => this.collection();
}

const BigQuestionSchema = CollectionSchema(
  name: r'BigQuestion',
  id: 4728239668667416688,
  properties: {
    r'bigQuestionContent': PropertySchema(
      id: 0,
      name: r'bigQuestionContent',
      type: IsarType.string,
    ),
    r'bigQuestionId': PropertySchema(
      id: 1,
      name: r'bigQuestionId',
      type: IsarType.long,
    ),
    r'bsort': PropertySchema(
      id: 2,
      name: r'bsort',
      type: IsarType.long,
    ),
    r'collect': PropertySchema(
      id: 3,
      name: r'collect',
      type: IsarType.long,
    ),
    r'collectId': PropertySchema(
      id: 4,
      name: r'collectId',
      type: IsarType.string,
    ),
    r'content': PropertySchema(
      id: 5,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdTime': PropertySchema(
      id: 6,
      name: r'createdTime',
      type: IsarType.dateTime,
    ),
    r'examCenter': PropertySchema(
      id: 7,
      name: r'examCenter',
      type: IsarType.string,
    ),
    r'hearingFile': PropertySchema(
      id: 8,
      name: r'hearingFile',
      type: IsarType.string,
    ),
    r'isDone': PropertySchema(
      id: 9,
      name: r'isDone',
      type: IsarType.bool,
    ),
    r'isParallel': PropertySchema(
      id: 10,
      name: r'isParallel',
      type: IsarType.bool,
    ),
    r'lsort': PropertySchema(
      id: 11,
      name: r'lsort',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 12,
      name: r'name',
      type: IsarType.string,
    ),
    r'paperId': PropertySchema(
      id: 13,
      name: r'paperId',
      type: IsarType.long,
    ),
    r'prId': PropertySchema(
      id: 14,
      name: r'prId',
      type: IsarType.string,
    ),
    r'readContent': PropertySchema(
      id: 15,
      name: r'readContent',
      type: IsarType.string,
    ),
    r'sideNumber': PropertySchema(
      id: 16,
      name: r'sideNumber',
      type: IsarType.long,
    ),
    r'sort': PropertySchema(
      id: 17,
      name: r'sort',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 18,
      name: r'type',
      type: IsarType.long,
    ),
    r'updatedTime': PropertySchema(
      id: 19,
      name: r'updatedTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bigQuestionEstimateSize,
  serialize: _bigQuestionSerialize,
  deserialize: _bigQuestionDeserialize,
  deserializeProp: _bigQuestionDeserializeProp,
  idName: r'id',
  indexes: {
    r'bigQuestionId': IndexSchema(
      id: 1785869922589682362,
      name: r'bigQuestionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bigQuestionId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bigQuestionGetId,
  getLinks: _bigQuestionGetLinks,
  attach: _bigQuestionAttach,
  version: '3.1.0+1',
);

int _bigQuestionEstimateSize(
  BigQuestion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bigQuestionContent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.collectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.content;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.examCenter;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hearingFile;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.prId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.readContent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _bigQuestionSerialize(
  BigQuestion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bigQuestionContent);
  writer.writeLong(offsets[1], object.bigQuestionId);
  writer.writeLong(offsets[2], object.bsort);
  writer.writeLong(offsets[3], object.collect);
  writer.writeString(offsets[4], object.collectId);
  writer.writeString(offsets[5], object.content);
  writer.writeDateTime(offsets[6], object.createdTime);
  writer.writeString(offsets[7], object.examCenter);
  writer.writeString(offsets[8], object.hearingFile);
  writer.writeBool(offsets[9], object.isDone);
  writer.writeBool(offsets[10], object.isParallel);
  writer.writeLong(offsets[11], object.lsort);
  writer.writeString(offsets[12], object.name);
  writer.writeLong(offsets[13], object.paperId);
  writer.writeString(offsets[14], object.prId);
  writer.writeString(offsets[15], object.readContent);
  writer.writeLong(offsets[16], object.sideNumber);
  writer.writeLong(offsets[17], object.sort);
  writer.writeLong(offsets[18], object.type);
  writer.writeDateTime(offsets[19], object.updatedTime);
}

BigQuestion _bigQuestionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BigQuestion();
  object.bigQuestionContent = reader.readStringOrNull(offsets[0]);
  object.bigQuestionId = reader.readLong(offsets[1]);
  object.bsort = reader.readLongOrNull(offsets[2]);
  object.collect = reader.readLongOrNull(offsets[3]);
  object.collectId = reader.readStringOrNull(offsets[4]);
  object.content = reader.readStringOrNull(offsets[5]);
  object.createdTime = reader.readDateTimeOrNull(offsets[6]);
  object.examCenter = reader.readStringOrNull(offsets[7]);
  object.hearingFile = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.isDone = reader.readBoolOrNull(offsets[9]);
  object.isParallel = reader.readBool(offsets[10]);
  object.lsort = reader.readLongOrNull(offsets[11]);
  object.name = reader.readStringOrNull(offsets[12]);
  object.paperId = reader.readLong(offsets[13]);
  object.prId = reader.readStringOrNull(offsets[14]);
  object.readContent = reader.readStringOrNull(offsets[15]);
  object.sideNumber = reader.readLongOrNull(offsets[16]);
  object.sort = reader.readLongOrNull(offsets[17]);
  object.type = reader.readLongOrNull(offsets[18]);
  object.updatedTime = reader.readDateTimeOrNull(offsets[19]);
  return object;
}

P _bigQuestionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bigQuestionGetId(BigQuestion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bigQuestionGetLinks(BigQuestion object) {
  return [];
}

void _bigQuestionAttach(
    IsarCollection<dynamic> col, Id id, BigQuestion object) {
  object.id = id;
}

extension BigQuestionByIndex on IsarCollection<BigQuestion> {
  Future<BigQuestion?> getByBigQuestionId(int bigQuestionId) {
    return getByIndex(r'bigQuestionId', [bigQuestionId]);
  }

  BigQuestion? getByBigQuestionIdSync(int bigQuestionId) {
    return getByIndexSync(r'bigQuestionId', [bigQuestionId]);
  }

  Future<bool> deleteByBigQuestionId(int bigQuestionId) {
    return deleteByIndex(r'bigQuestionId', [bigQuestionId]);
  }

  bool deleteByBigQuestionIdSync(int bigQuestionId) {
    return deleteByIndexSync(r'bigQuestionId', [bigQuestionId]);
  }

  Future<List<BigQuestion?>> getAllByBigQuestionId(
      List<int> bigQuestionIdValues) {
    final values = bigQuestionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'bigQuestionId', values);
  }

  List<BigQuestion?> getAllByBigQuestionIdSync(List<int> bigQuestionIdValues) {
    final values = bigQuestionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bigQuestionId', values);
  }

  Future<int> deleteAllByBigQuestionId(List<int> bigQuestionIdValues) {
    final values = bigQuestionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bigQuestionId', values);
  }

  int deleteAllByBigQuestionIdSync(List<int> bigQuestionIdValues) {
    final values = bigQuestionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bigQuestionId', values);
  }

  Future<Id> putByBigQuestionId(BigQuestion object) {
    return putByIndex(r'bigQuestionId', object);
  }

  Id putByBigQuestionIdSync(BigQuestion object, {bool saveLinks = true}) {
    return putByIndexSync(r'bigQuestionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBigQuestionId(List<BigQuestion> objects) {
    return putAllByIndex(r'bigQuestionId', objects);
  }

  List<Id> putAllByBigQuestionIdSync(List<BigQuestion> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'bigQuestionId', objects, saveLinks: saveLinks);
  }
}

extension BigQuestionQueryWhereSort
    on QueryBuilder<BigQuestion, BigQuestion, QWhere> {
  QueryBuilder<BigQuestion, BigQuestion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhere> anyBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bigQuestionId'),
      );
    });
  }
}

extension BigQuestionQueryWhere
    on QueryBuilder<BigQuestion, BigQuestion, QWhereClause> {
  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
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

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause>
      bigQuestionIdEqualTo(int bigQuestionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bigQuestionId',
        value: [bigQuestionId],
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause>
      bigQuestionIdNotEqualTo(int bigQuestionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bigQuestionId',
              lower: [],
              upper: [bigQuestionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bigQuestionId',
              lower: [bigQuestionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bigQuestionId',
              lower: [bigQuestionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bigQuestionId',
              lower: [],
              upper: [bigQuestionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause>
      bigQuestionIdGreaterThan(
    int bigQuestionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bigQuestionId',
        lower: [bigQuestionId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause>
      bigQuestionIdLessThan(
    int bigQuestionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bigQuestionId',
        lower: [],
        upper: [bigQuestionId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterWhereClause>
      bigQuestionIdBetween(
    int lowerBigQuestionId,
    int upperBigQuestionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bigQuestionId',
        lower: [lowerBigQuestionId],
        includeLower: includeLower,
        upper: [upperBigQuestionId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BigQuestionQueryFilter
    on QueryBuilder<BigQuestion, BigQuestion, QFilterCondition> {
  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bigQuestionContent',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bigQuestionContent',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bigQuestionContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bigQuestionContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bigQuestionContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bigQuestionContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bigQuestionContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bigQuestionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bigQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> bsortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bsort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bsortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bsort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> bsortEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      bsortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> bsortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> bsortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bsort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'collect',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'collect',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> collectEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collect',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collect',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> collectLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collect',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> collectBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collect',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'collectId',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'collectId',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'collectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'collectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectId',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      collectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'collectId',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'content',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      createdTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'examCenter',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'examCenter',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examCenter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examCenter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examCenter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examCenter',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      examCenterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examCenter',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hearingFile',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hearingFile',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hearingFile',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hearingFile',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hearingFile',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hearingFile',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      hearingFileIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hearingFile',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> idGreaterThan(
    Id value, {
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

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> idLessThan(
    Id value, {
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

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> isDoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isDone',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      isDoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isDone',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> isDoneEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDone',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      isParallelEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isParallel',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> lsortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lsort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      lsortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lsort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> lsortEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      lsortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> lsortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lsort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> lsortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lsort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> paperIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      paperIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> paperIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> paperIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paperId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'prId',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      prIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'prId',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'prId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'prId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> prIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prId',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      prIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'prId',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'readContent',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'readContent',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'readContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'readContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'readContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'readContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      readContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'readContent',
        value: '',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sideNumber',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sideNumber',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sideNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sideNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sideNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sideNumberBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sideNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> sortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      sortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> sortEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> sortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> sortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> sortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> typeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> typeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> typeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition> typeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterFilterCondition>
      updatedTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BigQuestionQueryObject
    on QueryBuilder<BigQuestion, BigQuestion, QFilterCondition> {}

extension BigQuestionQueryLinks
    on QueryBuilder<BigQuestion, BigQuestion, QFilterCondition> {}

extension BigQuestionQuerySortBy
    on QueryBuilder<BigQuestion, BigQuestion, QSortBy> {
  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      sortByBigQuestionContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionContent', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      sortByBigQuestionContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionContent', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      sortByBigQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByBsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bsort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByBsortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bsort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCollect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collect', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCollectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collect', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCollectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCollectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByExamCenter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examCenter', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByExamCenterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examCenter', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByHearingFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByHearingFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByIsDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByIsParallel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParallel', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByIsParallelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParallel', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByLsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lsort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByLsortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lsort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByPrId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByPrIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByReadContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readContent', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByReadContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readContent', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortBySideNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideNumber', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortBySideNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideNumber', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> sortByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }
}

extension BigQuestionQuerySortThenBy
    on QueryBuilder<BigQuestion, BigQuestion, QSortThenBy> {
  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      thenByBigQuestionContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionContent', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      thenByBigQuestionContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionContent', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy>
      thenByBigQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByBsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bsort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByBsortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bsort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCollect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collect', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCollectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collect', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCollectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCollectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByExamCenter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examCenter', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByExamCenterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examCenter', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByHearingFile() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByHearingFileDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hearingFile', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByIsDoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDone', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByIsParallel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParallel', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByIsParallelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isParallel', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByLsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lsort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByLsortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lsort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByPrId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prId', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByPrIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prId', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByReadContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readContent', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByReadContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'readContent', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenBySideNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideNumber', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenBySideNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sideNumber', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QAfterSortBy> thenByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }
}

extension BigQuestionQueryWhereDistinct
    on QueryBuilder<BigQuestion, BigQuestion, QDistinct> {
  QueryBuilder<BigQuestion, BigQuestion, QDistinct>
      distinctByBigQuestionContent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bigQuestionContent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bigQuestionId');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByBsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bsort');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByCollect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collect');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByCollectId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdTime');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByExamCenter(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examCenter', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByHearingFile(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hearingFile', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByIsDone() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDone');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByIsParallel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isParallel');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByLsort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lsort');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paperId');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByPrId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByReadContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'readContent', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctBySideNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sideNumber');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<BigQuestion, BigQuestion, QDistinct> distinctByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedTime');
    });
  }
}

extension BigQuestionQueryProperty
    on QueryBuilder<BigQuestion, BigQuestion, QQueryProperty> {
  QueryBuilder<BigQuestion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations>
      bigQuestionContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bigQuestionContent');
    });
  }

  QueryBuilder<BigQuestion, int, QQueryOperations> bigQuestionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bigQuestionId');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> bsortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bsort');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> collectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collect');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> collectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectId');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<BigQuestion, DateTime?, QQueryOperations> createdTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdTime');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> examCenterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examCenter');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> hearingFileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hearingFile');
    });
  }

  QueryBuilder<BigQuestion, bool?, QQueryOperations> isDoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDone');
    });
  }

  QueryBuilder<BigQuestion, bool, QQueryOperations> isParallelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isParallel');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> lsortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lsort');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BigQuestion, int, QQueryOperations> paperIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paperId');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> prIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prId');
    });
  }

  QueryBuilder<BigQuestion, String?, QQueryOperations> readContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'readContent');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> sideNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sideNumber');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }

  QueryBuilder<BigQuestion, int?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<BigQuestion, DateTime?, QQueryOperations> updatedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionReadingCollection on Isar {
  IsarCollection<QuestionReading> get questionReadings => this.collection();
}

const QuestionReadingSchema = CollectionSchema(
  name: r'QuestionReading',
  id: -2588847824504137647,
  properties: {
    r'bigQuestionId': PropertySchema(
      id: 0,
      name: r'bigQuestionId',
      type: IsarType.long,
    ),
    r'content': PropertySchema(
      id: 1,
      name: r'content',
      type: IsarType.string,
    ),
    r'createdTime': PropertySchema(
      id: 2,
      name: r'createdTime',
      type: IsarType.dateTime,
    ),
    r'sort': PropertySchema(
      id: 3,
      name: r'sort',
      type: IsarType.long,
    ),
    r'updatedTime': PropertySchema(
      id: 4,
      name: r'updatedTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _questionReadingEstimateSize,
  serialize: _questionReadingSerialize,
  deserialize: _questionReadingDeserialize,
  deserializeProp: _questionReadingDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _questionReadingGetId,
  getLinks: _questionReadingGetLinks,
  attach: _questionReadingAttach,
  version: '3.1.0+1',
);

int _questionReadingEstimateSize(
  QuestionReading object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  return bytesCount;
}

void _questionReadingSerialize(
  QuestionReading object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bigQuestionId);
  writer.writeString(offsets[1], object.content);
  writer.writeDateTime(offsets[2], object.createdTime);
  writer.writeLong(offsets[3], object.sort);
  writer.writeDateTime(offsets[4], object.updatedTime);
}

QuestionReading _questionReadingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionReading();
  object.bigQuestionId = reader.readLong(offsets[0]);
  object.content = reader.readString(offsets[1]);
  object.createdTime = reader.readDateTimeOrNull(offsets[2]);
  object.id = id;
  object.sort = reader.readLong(offsets[3]);
  object.updatedTime = reader.readDateTimeOrNull(offsets[4]);
  return object;
}

P _questionReadingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionReadingGetId(QuestionReading object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionReadingGetLinks(QuestionReading object) {
  return [];
}

void _questionReadingAttach(
    IsarCollection<dynamic> col, Id id, QuestionReading object) {
  object.id = id;
}

extension QuestionReadingQueryWhereSort
    on QueryBuilder<QuestionReading, QuestionReading, QWhere> {
  QueryBuilder<QuestionReading, QuestionReading, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionReadingQueryWhere
    on QueryBuilder<QuestionReading, QuestionReading, QWhereClause> {
  QueryBuilder<QuestionReading, QuestionReading, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<QuestionReading, QuestionReading, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
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
}

extension QuestionReadingQueryFilter
    on QueryBuilder<QuestionReading, QuestionReading, QFilterCondition> {
  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      bigQuestionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      bigQuestionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      bigQuestionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bigQuestionId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      bigQuestionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bigQuestionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdTime',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      createdTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      sortEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      sortGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      sortLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      sortBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedTime',
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedTime',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterFilterCondition>
      updatedTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuestionReadingQueryObject
    on QueryBuilder<QuestionReading, QuestionReading, QFilterCondition> {}

extension QuestionReadingQueryLinks
    on QueryBuilder<QuestionReading, QuestionReading, QFilterCondition> {}

extension QuestionReadingQuerySortBy
    on QueryBuilder<QuestionReading, QuestionReading, QSortBy> {
  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByBigQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      sortByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }
}

extension QuestionReadingQuerySortThenBy
    on QueryBuilder<QuestionReading, QuestionReading, QSortThenBy> {
  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByBigQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bigQuestionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByCreatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdTime', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy> thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.asc);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QAfterSortBy>
      thenByUpdatedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedTime', Sort.desc);
    });
  }
}

extension QuestionReadingQueryWhereDistinct
    on QueryBuilder<QuestionReading, QuestionReading, QDistinct> {
  QueryBuilder<QuestionReading, QuestionReading, QDistinct>
      distinctByBigQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bigQuestionId');
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QDistinct>
      distinctByCreatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdTime');
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QDistinct> distinctBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort');
    });
  }

  QueryBuilder<QuestionReading, QuestionReading, QDistinct>
      distinctByUpdatedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedTime');
    });
  }
}

extension QuestionReadingQueryProperty
    on QueryBuilder<QuestionReading, QuestionReading, QQueryProperty> {
  QueryBuilder<QuestionReading, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionReading, int, QQueryOperations> bigQuestionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bigQuestionId');
    });
  }

  QueryBuilder<QuestionReading, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<QuestionReading, DateTime?, QQueryOperations>
      createdTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdTime');
    });
  }

  QueryBuilder<QuestionReading, int, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }

  QueryBuilder<QuestionReading, DateTime?, QQueryOperations>
      updatedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaperQuestionTypeCollection on Isar {
  IsarCollection<PaperQuestionType> get paperQuestionTypes => this.collection();
}

const PaperQuestionTypeSchema = CollectionSchema(
  name: r'PaperQuestionType',
  id: -8598006634306503723,
  properties: {
    r'code': PropertySchema(
      id: 0,
      name: r'code',
      type: IsarType.string,
    ),
    r'isSelect': PropertySchema(
      id: 1,
      name: r'isSelect',
      type: IsarType.bool,
    ),
    r'paperId': PropertySchema(
      id: 2,
      name: r'paperId',
      type: IsarType.long,
    ),
    r'score': PropertySchema(
      id: 3,
      name: r'score',
      type: IsarType.double,
    ),
    r'sort': PropertySchema(
      id: 4,
      name: r'sort',
      type: IsarType.long,
    ),
    r'typeId': PropertySchema(
      id: 5,
      name: r'typeId',
      type: IsarType.long,
    )
  },
  estimateSize: _paperQuestionTypeEstimateSize,
  serialize: _paperQuestionTypeSerialize,
  deserialize: _paperQuestionTypeDeserialize,
  deserializeProp: _paperQuestionTypeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _paperQuestionTypeGetId,
  getLinks: _paperQuestionTypeGetLinks,
  attach: _paperQuestionTypeAttach,
  version: '3.1.0+1',
);

int _paperQuestionTypeEstimateSize(
  PaperQuestionType object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.code;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paperQuestionTypeSerialize(
  PaperQuestionType object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.code);
  writer.writeBool(offsets[1], object.isSelect);
  writer.writeLong(offsets[2], object.paperId);
  writer.writeDouble(offsets[3], object.score);
  writer.writeLong(offsets[4], object.sort);
  writer.writeLong(offsets[5], object.typeId);
}

PaperQuestionType _paperQuestionTypeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PaperQuestionType();
  object.code = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.isSelect = reader.readBool(offsets[1]);
  object.paperId = reader.readLong(offsets[2]);
  object.score = reader.readDoubleOrNull(offsets[3]);
  object.sort = reader.readLongOrNull(offsets[4]);
  object.typeId = reader.readLong(offsets[5]);
  return object;
}

P _paperQuestionTypeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _paperQuestionTypeGetId(PaperQuestionType object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paperQuestionTypeGetLinks(
    PaperQuestionType object) {
  return [];
}

void _paperQuestionTypeAttach(
    IsarCollection<dynamic> col, Id id, PaperQuestionType object) {
  object.id = id;
}

extension PaperQuestionTypeQueryWhereSort
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QWhere> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaperQuestionTypeQueryWhere
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QWhereClause> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
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
}

extension PaperQuestionTypeQueryFilter
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QFilterCondition> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'code',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'code',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'code',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'code',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      codeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'code',
        value: '',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
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

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      idLessThan(
    Id value, {
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

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      isSelectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSelect',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      paperIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      paperIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      paperIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paperId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      paperIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paperId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      scoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sort',
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      sortBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      typeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      typeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      typeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'typeId',
        value: value,
      ));
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterFilterCondition>
      typeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'typeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PaperQuestionTypeQueryObject
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QFilterCondition> {}

extension PaperQuestionTypeQueryLinks
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QFilterCondition> {}

extension PaperQuestionTypeQuerySortBy
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QSortBy> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByIsSelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelect', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByIsSelectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelect', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      sortByTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.desc);
    });
  }
}

extension PaperQuestionTypeQuerySortThenBy
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QSortThenBy> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'code', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByIsSelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelect', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByIsSelectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSelect', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByPaperIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperId', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.asc);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QAfterSortBy>
      thenByTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeId', Sort.desc);
    });
  }
}

extension PaperQuestionTypeQueryWhereDistinct
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct> {
  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'code', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct>
      distinctByIsSelect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSelect');
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct>
      distinctByPaperId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paperId');
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct>
      distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct>
      distinctBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort');
    });
  }

  QueryBuilder<PaperQuestionType, PaperQuestionType, QDistinct>
      distinctByTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeId');
    });
  }
}

extension PaperQuestionTypeQueryProperty
    on QueryBuilder<PaperQuestionType, PaperQuestionType, QQueryProperty> {
  QueryBuilder<PaperQuestionType, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PaperQuestionType, String?, QQueryOperations> codeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'code');
    });
  }

  QueryBuilder<PaperQuestionType, bool, QQueryOperations> isSelectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSelect');
    });
  }

  QueryBuilder<PaperQuestionType, int, QQueryOperations> paperIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paperId');
    });
  }

  QueryBuilder<PaperQuestionType, double?, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<PaperQuestionType, int?, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }

  QueryBuilder<PaperQuestionType, int, QQueryOperations> typeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeId');
    });
  }
}
