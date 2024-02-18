// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProjectTable extends Project with TableInfo<$ProjectTable, ProjectData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project';
  @override
  VerificationContext validateIntegrity(Insertable<ProjectData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProjectData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $ProjectTable createAlias(String alias) {
    return $ProjectTable(attachedDatabase, alias);
  }
}

class ProjectData extends DataClass implements Insertable<ProjectData> {
  final int id;
  final String name;
  const ProjectData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  ProjectCompanion toCompanion(bool nullToAbsent) {
    return ProjectCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory ProjectData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  ProjectData copyWith({int? id, String? name}) => ProjectData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ProjectData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectData && other.id == this.id && other.name == this.name);
}

class ProjectCompanion extends UpdateCompanion<ProjectData> {
  final Value<int> id;
  final Value<String> name;
  const ProjectCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ProjectCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<ProjectData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ProjectCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return ProjectCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $OperatorTable extends Operator
    with TableInfo<$OperatorTable, OperatorData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OperatorTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'operator';
  @override
  VerificationContext validateIntegrity(Insertable<OperatorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OperatorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OperatorData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $OperatorTable createAlias(String alias) {
    return $OperatorTable(attachedDatabase, alias);
  }
}

class OperatorData extends DataClass implements Insertable<OperatorData> {
  final int id;
  final String name;
  const OperatorData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  OperatorCompanion toCompanion(bool nullToAbsent) {
    return OperatorCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory OperatorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperatorData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  OperatorData copyWith({int? id, String? name}) => OperatorData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('OperatorData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperatorData && other.id == this.id && other.name == this.name);
}

class OperatorCompanion extends UpdateCompanion<OperatorData> {
  final Value<int> id;
  final Value<String> name;
  const OperatorCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  OperatorCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<OperatorData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  OperatorCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return OperatorCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperatorCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TaskTable extends Task with TableInfo<$TaskTable, TaskData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _operatorNameMeta =
      const VerificationMeta('operatorName');
  @override
  late final GeneratedColumn<int> operatorName = GeneratedColumn<int>(
      'operator_name', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES operator (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schematicIdMeta =
      const VerificationMeta('schematicId');
  @override
  late final GeneratedColumn<String> schematicId = GeneratedColumn<String>(
      'schematic_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _partMeta = const VerificationMeta('part');
  @override
  late final GeneratedColumn<String> part = GeneratedColumn<String>(
      'part', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _operatorOrderMeta =
      const VerificationMeta('operatorOrder');
  @override
  late final GeneratedColumn<int> operatorOrder = GeneratedColumn<int>(
      'operator_order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _costManHourMeta =
      const VerificationMeta('costManHour');
  @override
  late final GeneratedColumn<int> costManHour = GeneratedColumn<int>(
      'cost_man_hour', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'progress', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("done" IN (0, 1))'));
  static const VerificationMeta _projectMeta =
      const VerificationMeta('project');
  @override
  late final GeneratedColumn<int> project = GeneratedColumn<int>(
      'project', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES project (id)'));
  static const VerificationMeta _attachmentMeta =
      const VerificationMeta('attachment');
  @override
  late final GeneratedColumn<Uint8List> attachment = GeneratedColumn<Uint8List>(
      'attachment', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operatorName,
        name,
        schematicId,
        part,
        duration,
        order,
        operatorOrder,
        tags,
        priority,
        costManHour,
        start,
        finish,
        progress,
        done,
        project,
        attachment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task';
  @override
  VerificationContext validateIntegrity(Insertable<TaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('operator_name')) {
      context.handle(
          _operatorNameMeta,
          operatorName.isAcceptableOrUnknown(
              data['operator_name']!, _operatorNameMeta));
    } else if (isInserting) {
      context.missing(_operatorNameMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('schematic_id')) {
      context.handle(
          _schematicIdMeta,
          schematicId.isAcceptableOrUnknown(
              data['schematic_id']!, _schematicIdMeta));
    } else if (isInserting) {
      context.missing(_schematicIdMeta);
    }
    if (data.containsKey('part')) {
      context.handle(
          _partMeta, part.isAcceptableOrUnknown(data['part']!, _partMeta));
    } else if (isInserting) {
      context.missing(_partMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    if (data.containsKey('operator_order')) {
      context.handle(
          _operatorOrderMeta,
          operatorOrder.isAcceptableOrUnknown(
              data['operator_order']!, _operatorOrderMeta));
    } else if (isInserting) {
      context.missing(_operatorOrderMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('cost_man_hour')) {
      context.handle(
          _costManHourMeta,
          costManHour.isAcceptableOrUnknown(
              data['cost_man_hour']!, _costManHourMeta));
    } else if (isInserting) {
      context.missing(_costManHourMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    } else if (isInserting) {
      context.missing(_projectMeta);
    }
    if (data.containsKey('attachment')) {
      context.handle(
          _attachmentMeta,
          attachment.isAcceptableOrUnknown(
              data['attachment']!, _attachmentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      operatorName: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operator_name'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      schematicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}schematic_id'])!,
      part: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}part'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order']),
      operatorOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}operator_order'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      costManHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost_man_hour'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}progress']),
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done']),
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project'])!,
      attachment: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}attachment']),
    );
  }

  @override
  $TaskTable createAlias(String alias) {
    return $TaskTable(attachedDatabase, alias);
  }
}

class TaskData extends DataClass implements Insertable<TaskData> {
  final int id;
  final int operatorName;
  final String name;
  final String schematicId;
  final String part;
  final int duration;
  final int? order;
  final int operatorOrder;
  final String tags;
  final int priority;
  final int costManHour;
  final DateTime? start;
  final DateTime? finish;
  final int? progress;
  final bool? done;
  final int project;
  final Uint8List? attachment;
  const TaskData(
      {required this.id,
      required this.operatorName,
      required this.name,
      required this.schematicId,
      required this.part,
      required this.duration,
      this.order,
      required this.operatorOrder,
      required this.tags,
      required this.priority,
      required this.costManHour,
      this.start,
      this.finish,
      this.progress,
      this.done,
      required this.project,
      this.attachment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operator_name'] = Variable<int>(operatorName);
    map['name'] = Variable<String>(name);
    map['schematic_id'] = Variable<String>(schematicId);
    map['part'] = Variable<String>(part);
    map['duration'] = Variable<int>(duration);
    if (!nullToAbsent || order != null) {
      map['order'] = Variable<int>(order);
    }
    map['operator_order'] = Variable<int>(operatorOrder);
    map['tags'] = Variable<String>(tags);
    map['priority'] = Variable<int>(priority);
    map['cost_man_hour'] = Variable<int>(costManHour);
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || progress != null) {
      map['progress'] = Variable<int>(progress);
    }
    if (!nullToAbsent || done != null) {
      map['done'] = Variable<bool>(done);
    }
    map['project'] = Variable<int>(project);
    if (!nullToAbsent || attachment != null) {
      map['attachment'] = Variable<Uint8List>(attachment);
    }
    return map;
  }

  TaskCompanion toCompanion(bool nullToAbsent) {
    return TaskCompanion(
      id: Value(id),
      operatorName: Value(operatorName),
      name: Value(name),
      schematicId: Value(schematicId),
      part: Value(part),
      duration: Value(duration),
      order:
          order == null && nullToAbsent ? const Value.absent() : Value(order),
      operatorOrder: Value(operatorOrder),
      tags: Value(tags),
      priority: Value(priority),
      costManHour: Value(costManHour),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      done: done == null && nullToAbsent ? const Value.absent() : Value(done),
      project: Value(project),
      attachment: attachment == null && nullToAbsent
          ? const Value.absent()
          : Value(attachment),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<int>(json['id']),
      operatorName: serializer.fromJson<int>(json['operatorName']),
      name: serializer.fromJson<String>(json['name']),
      schematicId: serializer.fromJson<String>(json['schematicId']),
      part: serializer.fromJson<String>(json['part']),
      duration: serializer.fromJson<int>(json['duration']),
      order: serializer.fromJson<int?>(json['order']),
      operatorOrder: serializer.fromJson<int>(json['operatorOrder']),
      tags: serializer.fromJson<String>(json['tags']),
      priority: serializer.fromJson<int>(json['priority']),
      costManHour: serializer.fromJson<int>(json['costManHour']),
      start: serializer.fromJson<DateTime?>(json['start']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      progress: serializer.fromJson<int?>(json['progress']),
      done: serializer.fromJson<bool?>(json['done']),
      project: serializer.fromJson<int>(json['project']),
      attachment: serializer.fromJson<Uint8List?>(json['attachment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operatorName': serializer.toJson<int>(operatorName),
      'name': serializer.toJson<String>(name),
      'schematicId': serializer.toJson<String>(schematicId),
      'part': serializer.toJson<String>(part),
      'duration': serializer.toJson<int>(duration),
      'order': serializer.toJson<int?>(order),
      'operatorOrder': serializer.toJson<int>(operatorOrder),
      'tags': serializer.toJson<String>(tags),
      'priority': serializer.toJson<int>(priority),
      'costManHour': serializer.toJson<int>(costManHour),
      'start': serializer.toJson<DateTime?>(start),
      'finish': serializer.toJson<DateTime?>(finish),
      'progress': serializer.toJson<int?>(progress),
      'done': serializer.toJson<bool?>(done),
      'project': serializer.toJson<int>(project),
      'attachment': serializer.toJson<Uint8List?>(attachment),
    };
  }

  TaskData copyWith(
          {int? id,
          int? operatorName,
          String? name,
          String? schematicId,
          String? part,
          int? duration,
          Value<int?> order = const Value.absent(),
          int? operatorOrder,
          String? tags,
          int? priority,
          int? costManHour,
          Value<DateTime?> start = const Value.absent(),
          Value<DateTime?> finish = const Value.absent(),
          Value<int?> progress = const Value.absent(),
          Value<bool?> done = const Value.absent(),
          int? project,
          Value<Uint8List?> attachment = const Value.absent()}) =>
      TaskData(
        id: id ?? this.id,
        operatorName: operatorName ?? this.operatorName,
        name: name ?? this.name,
        schematicId: schematicId ?? this.schematicId,
        part: part ?? this.part,
        duration: duration ?? this.duration,
        order: order.present ? order.value : this.order,
        operatorOrder: operatorOrder ?? this.operatorOrder,
        tags: tags ?? this.tags,
        priority: priority ?? this.priority,
        costManHour: costManHour ?? this.costManHour,
        start: start.present ? start.value : this.start,
        finish: finish.present ? finish.value : this.finish,
        progress: progress.present ? progress.value : this.progress,
        done: done.present ? done.value : this.done,
        project: project ?? this.project,
        attachment: attachment.present ? attachment.value : this.attachment,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('operatorName: $operatorName, ')
          ..write('name: $name, ')
          ..write('schematicId: $schematicId, ')
          ..write('part: $part, ')
          ..write('duration: $duration, ')
          ..write('order: $order, ')
          ..write('operatorOrder: $operatorOrder, ')
          ..write('tags: $tags, ')
          ..write('priority: $priority, ')
          ..write('costManHour: $costManHour, ')
          ..write('start: $start, ')
          ..write('finish: $finish, ')
          ..write('progress: $progress, ')
          ..write('done: $done, ')
          ..write('project: $project, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      operatorName,
      name,
      schematicId,
      part,
      duration,
      order,
      operatorOrder,
      tags,
      priority,
      costManHour,
      start,
      finish,
      progress,
      done,
      project,
      $driftBlobEquality.hash(attachment));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.operatorName == this.operatorName &&
          other.name == this.name &&
          other.schematicId == this.schematicId &&
          other.part == this.part &&
          other.duration == this.duration &&
          other.order == this.order &&
          other.operatorOrder == this.operatorOrder &&
          other.tags == this.tags &&
          other.priority == this.priority &&
          other.costManHour == this.costManHour &&
          other.start == this.start &&
          other.finish == this.finish &&
          other.progress == this.progress &&
          other.done == this.done &&
          other.project == this.project &&
          $driftBlobEquality.equals(other.attachment, this.attachment));
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<int> operatorName;
  final Value<String> name;
  final Value<String> schematicId;
  final Value<String> part;
  final Value<int> duration;
  final Value<int?> order;
  final Value<int> operatorOrder;
  final Value<String> tags;
  final Value<int> priority;
  final Value<int> costManHour;
  final Value<DateTime?> start;
  final Value<DateTime?> finish;
  final Value<int?> progress;
  final Value<bool?> done;
  final Value<int> project;
  final Value<Uint8List?> attachment;
  const TaskCompanion({
    this.id = const Value.absent(),
    this.operatorName = const Value.absent(),
    this.name = const Value.absent(),
    this.schematicId = const Value.absent(),
    this.part = const Value.absent(),
    this.duration = const Value.absent(),
    this.order = const Value.absent(),
    this.operatorOrder = const Value.absent(),
    this.tags = const Value.absent(),
    this.priority = const Value.absent(),
    this.costManHour = const Value.absent(),
    this.start = const Value.absent(),
    this.finish = const Value.absent(),
    this.progress = const Value.absent(),
    this.done = const Value.absent(),
    this.project = const Value.absent(),
    this.attachment = const Value.absent(),
  });
  TaskCompanion.insert({
    this.id = const Value.absent(),
    required int operatorName,
    required String name,
    required String schematicId,
    required String part,
    required int duration,
    this.order = const Value.absent(),
    required int operatorOrder,
    required String tags,
    required int priority,
    required int costManHour,
    this.start = const Value.absent(),
    this.finish = const Value.absent(),
    this.progress = const Value.absent(),
    this.done = const Value.absent(),
    required int project,
    this.attachment = const Value.absent(),
  })  : operatorName = Value(operatorName),
        name = Value(name),
        schematicId = Value(schematicId),
        part = Value(part),
        duration = Value(duration),
        operatorOrder = Value(operatorOrder),
        tags = Value(tags),
        priority = Value(priority),
        costManHour = Value(costManHour),
        project = Value(project);
  static Insertable<TaskData> custom({
    Expression<int>? id,
    Expression<int>? operatorName,
    Expression<String>? name,
    Expression<String>? schematicId,
    Expression<String>? part,
    Expression<int>? duration,
    Expression<int>? order,
    Expression<int>? operatorOrder,
    Expression<String>? tags,
    Expression<int>? priority,
    Expression<int>? costManHour,
    Expression<DateTime>? start,
    Expression<DateTime>? finish,
    Expression<int>? progress,
    Expression<bool>? done,
    Expression<int>? project,
    Expression<Uint8List>? attachment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operatorName != null) 'operator_name': operatorName,
      if (name != null) 'name': name,
      if (schematicId != null) 'schematic_id': schematicId,
      if (part != null) 'part': part,
      if (duration != null) 'duration': duration,
      if (order != null) 'order': order,
      if (operatorOrder != null) 'operator_order': operatorOrder,
      if (tags != null) 'tags': tags,
      if (priority != null) 'priority': priority,
      if (costManHour != null) 'cost_man_hour': costManHour,
      if (start != null) 'start': start,
      if (finish != null) 'finish': finish,
      if (progress != null) 'progress': progress,
      if (done != null) 'done': done,
      if (project != null) 'project': project,
      if (attachment != null) 'attachment': attachment,
    });
  }

  TaskCompanion copyWith(
      {Value<int>? id,
      Value<int>? operatorName,
      Value<String>? name,
      Value<String>? schematicId,
      Value<String>? part,
      Value<int>? duration,
      Value<int?>? order,
      Value<int>? operatorOrder,
      Value<String>? tags,
      Value<int>? priority,
      Value<int>? costManHour,
      Value<DateTime?>? start,
      Value<DateTime?>? finish,
      Value<int?>? progress,
      Value<bool?>? done,
      Value<int>? project,
      Value<Uint8List?>? attachment}) {
    return TaskCompanion(
      id: id ?? this.id,
      operatorName: operatorName ?? this.operatorName,
      name: name ?? this.name,
      schematicId: schematicId ?? this.schematicId,
      part: part ?? this.part,
      duration: duration ?? this.duration,
      order: order ?? this.order,
      operatorOrder: operatorOrder ?? this.operatorOrder,
      tags: tags ?? this.tags,
      priority: priority ?? this.priority,
      costManHour: costManHour ?? this.costManHour,
      start: start ?? this.start,
      finish: finish ?? this.finish,
      progress: progress ?? this.progress,
      done: done ?? this.done,
      project: project ?? this.project,
      attachment: attachment ?? this.attachment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (operatorName.present) {
      map['operator_name'] = Variable<int>(operatorName.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (schematicId.present) {
      map['schematic_id'] = Variable<String>(schematicId.value);
    }
    if (part.present) {
      map['part'] = Variable<String>(part.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (operatorOrder.present) {
      map['operator_order'] = Variable<int>(operatorOrder.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (costManHour.present) {
      map['cost_man_hour'] = Variable<int>(costManHour.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (project.present) {
      map['project'] = Variable<int>(project.value);
    }
    if (attachment.present) {
      map['attachment'] = Variable<Uint8List>(attachment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompanion(')
          ..write('id: $id, ')
          ..write('operatorName: $operatorName, ')
          ..write('name: $name, ')
          ..write('schematicId: $schematicId, ')
          ..write('part: $part, ')
          ..write('duration: $duration, ')
          ..write('order: $order, ')
          ..write('operatorOrder: $operatorOrder, ')
          ..write('tags: $tags, ')
          ..write('priority: $priority, ')
          ..write('costManHour: $costManHour, ')
          ..write('start: $start, ')
          ..write('finish: $finish, ')
          ..write('progress: $progress, ')
          ..write('done: $done, ')
          ..write('project: $project, ')
          ..write('attachment: $attachment')
          ..write(')'))
        .toString();
  }
}

class $DelayTable extends Delay with TableInfo<$DelayTable, DelayData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DelayTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<int> task = GeneratedColumn<int>(
      'task', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES task (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, task, description, time];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'delay';
  @override
  VerificationContext validateIntegrity(Insertable<DelayData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DelayData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DelayData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}task'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $DelayTable createAlias(String alias) {
    return $DelayTable(attachedDatabase, alias);
  }
}

class DelayData extends DataClass implements Insertable<DelayData> {
  final int id;
  final int task;
  final String description;
  final int time;
  const DelayData(
      {required this.id,
      required this.task,
      required this.description,
      required this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task'] = Variable<int>(task);
    map['description'] = Variable<String>(description);
    map['time'] = Variable<int>(time);
    return map;
  }

  DelayCompanion toCompanion(bool nullToAbsent) {
    return DelayCompanion(
      id: Value(id),
      task: Value(task),
      description: Value(description),
      time: Value(time),
    );
  }

  factory DelayData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DelayData(
      id: serializer.fromJson<int>(json['id']),
      task: serializer.fromJson<int>(json['task']),
      description: serializer.fromJson<String>(json['description']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'task': serializer.toJson<int>(task),
      'description': serializer.toJson<String>(description),
      'time': serializer.toJson<int>(time),
    };
  }

  DelayData copyWith({int? id, int? task, String? description, int? time}) =>
      DelayData(
        id: id ?? this.id,
        task: task ?? this.task,
        description: description ?? this.description,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('DelayData(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('description: $description, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, task, description, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DelayData &&
          other.id == this.id &&
          other.task == this.task &&
          other.description == this.description &&
          other.time == this.time);
}

class DelayCompanion extends UpdateCompanion<DelayData> {
  final Value<int> id;
  final Value<int> task;
  final Value<String> description;
  final Value<int> time;
  const DelayCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.description = const Value.absent(),
    this.time = const Value.absent(),
  });
  DelayCompanion.insert({
    this.id = const Value.absent(),
    required int task,
    required String description,
    required int time,
  })  : task = Value(task),
        description = Value(description),
        time = Value(time);
  static Insertable<DelayData> custom({
    Expression<int>? id,
    Expression<int>? task,
    Expression<String>? description,
    Expression<int>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (description != null) 'description': description,
      if (time != null) 'time': time,
    });
  }

  DelayCompanion copyWith(
      {Value<int>? id,
      Value<int>? task,
      Value<String>? description,
      Value<int>? time}) {
    return DelayCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (task.present) {
      map['task'] = Variable<int>(task.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DelayCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('description: $description, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ProjectTable project = $ProjectTable(this);
  late final $OperatorTable operator = $OperatorTable(this);
  late final $TaskTable task = $TaskTable(this);
  late final $DelayTable delay = $DelayTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [project, operator, task, delay];
}
