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
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, firstName, lastName];
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
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
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
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
    );
  }

  @override
  $OperatorTable createAlias(String alias) {
    return $OperatorTable(attachedDatabase, alias);
  }
}

class OperatorData extends DataClass implements Insertable<OperatorData> {
  final int id;
  final String firstName;
  final String lastName;
  const OperatorData(
      {required this.id, required this.firstName, required this.lastName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    return map;
  }

  OperatorCompanion toCompanion(bool nullToAbsent) {
    return OperatorCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
    );
  }

  factory OperatorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OperatorData(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
    };
  }

  OperatorData copyWith({int? id, String? firstName, String? lastName}) =>
      OperatorData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
  @override
  String toString() {
    return (StringBuffer('OperatorData(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OperatorData &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName);
}

class OperatorCompanion extends UpdateCompanion<OperatorData> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  const OperatorCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
  });
  OperatorCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
  })  : firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<OperatorData> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
    });
  }

  OperatorCompanion copyWith(
      {Value<int>? id, Value<String>? firstName, Value<String>? lastName}) {
    return OperatorCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OperatorCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
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
  static const VerificationMeta _schematicIdMeta =
      const VerificationMeta('schematicId');
  @override
  late final GeneratedColumn<String> schematicId = GeneratedColumn<String>(
      'schematic_id', aliasedName, false,
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
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'progress', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
      'done', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
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
  @override
  List<GeneratedColumn> get $columns => [
        id,
        operatorName,
        schematicId,
        duration,
        order,
        priority,
        costManHour,
        start,
        finish,
        progress,
        done,
        project
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
    if (data.containsKey('schematic_id')) {
      context.handle(
          _schematicIdMeta,
          schematicId.isAcceptableOrUnknown(
              data['schematic_id']!, _schematicIdMeta));
    } else if (isInserting) {
      context.missing(_schematicIdMeta);
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
    } else if (isInserting) {
      context.missing(_orderMeta);
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
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    } else if (isInserting) {
      context.missing(_finishMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    } else if (isInserting) {
      context.missing(_progressMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
          _doneMeta, done.isAcceptableOrUnknown(data['done']!, _doneMeta));
    } else if (isInserting) {
      context.missing(_doneMeta);
    }
    if (data.containsKey('project')) {
      context.handle(_projectMeta,
          project.isAcceptableOrUnknown(data['project']!, _projectMeta));
    } else if (isInserting) {
      context.missing(_projectMeta);
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
      schematicId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}schematic_id'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      costManHour: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost_man_hour'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}progress'])!,
      done: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}done'])!,
      project: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}project'])!,
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
  final String schematicId;
  final int duration;
  final int order;
  final int priority;
  final int costManHour;
  final DateTime start;
  final DateTime finish;
  final int progress;
  final bool done;
  final int project;
  const TaskData(
      {required this.id,
      required this.operatorName,
      required this.schematicId,
      required this.duration,
      required this.order,
      required this.priority,
      required this.costManHour,
      required this.start,
      required this.finish,
      required this.progress,
      required this.done,
      required this.project});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['operator_name'] = Variable<int>(operatorName);
    map['schematic_id'] = Variable<String>(schematicId);
    map['duration'] = Variable<int>(duration);
    map['order'] = Variable<int>(order);
    map['priority'] = Variable<int>(priority);
    map['cost_man_hour'] = Variable<int>(costManHour);
    map['start'] = Variable<DateTime>(start);
    map['finish'] = Variable<DateTime>(finish);
    map['progress'] = Variable<int>(progress);
    map['done'] = Variable<bool>(done);
    map['project'] = Variable<int>(project);
    return map;
  }

  TaskCompanion toCompanion(bool nullToAbsent) {
    return TaskCompanion(
      id: Value(id),
      operatorName: Value(operatorName),
      schematicId: Value(schematicId),
      duration: Value(duration),
      order: Value(order),
      priority: Value(priority),
      costManHour: Value(costManHour),
      start: Value(start),
      finish: Value(finish),
      progress: Value(progress),
      done: Value(done),
      project: Value(project),
    );
  }

  factory TaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskData(
      id: serializer.fromJson<int>(json['id']),
      operatorName: serializer.fromJson<int>(json['operatorName']),
      schematicId: serializer.fromJson<String>(json['schematicId']),
      duration: serializer.fromJson<int>(json['duration']),
      order: serializer.fromJson<int>(json['order']),
      priority: serializer.fromJson<int>(json['priority']),
      costManHour: serializer.fromJson<int>(json['costManHour']),
      start: serializer.fromJson<DateTime>(json['start']),
      finish: serializer.fromJson<DateTime>(json['finish']),
      progress: serializer.fromJson<int>(json['progress']),
      done: serializer.fromJson<bool>(json['done']),
      project: serializer.fromJson<int>(json['project']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'operatorName': serializer.toJson<int>(operatorName),
      'schematicId': serializer.toJson<String>(schematicId),
      'duration': serializer.toJson<int>(duration),
      'order': serializer.toJson<int>(order),
      'priority': serializer.toJson<int>(priority),
      'costManHour': serializer.toJson<int>(costManHour),
      'start': serializer.toJson<DateTime>(start),
      'finish': serializer.toJson<DateTime>(finish),
      'progress': serializer.toJson<int>(progress),
      'done': serializer.toJson<bool>(done),
      'project': serializer.toJson<int>(project),
    };
  }

  TaskData copyWith(
          {int? id,
          int? operatorName,
          String? schematicId,
          int? duration,
          int? order,
          int? priority,
          int? costManHour,
          DateTime? start,
          DateTime? finish,
          int? progress,
          bool? done,
          int? project}) =>
      TaskData(
        id: id ?? this.id,
        operatorName: operatorName ?? this.operatorName,
        schematicId: schematicId ?? this.schematicId,
        duration: duration ?? this.duration,
        order: order ?? this.order,
        priority: priority ?? this.priority,
        costManHour: costManHour ?? this.costManHour,
        start: start ?? this.start,
        finish: finish ?? this.finish,
        progress: progress ?? this.progress,
        done: done ?? this.done,
        project: project ?? this.project,
      );
  @override
  String toString() {
    return (StringBuffer('TaskData(')
          ..write('id: $id, ')
          ..write('operatorName: $operatorName, ')
          ..write('schematicId: $schematicId, ')
          ..write('duration: $duration, ')
          ..write('order: $order, ')
          ..write('priority: $priority, ')
          ..write('costManHour: $costManHour, ')
          ..write('start: $start, ')
          ..write('finish: $finish, ')
          ..write('progress: $progress, ')
          ..write('done: $done, ')
          ..write('project: $project')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, operatorName, schematicId, duration,
      order, priority, costManHour, start, finish, progress, done, project);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskData &&
          other.id == this.id &&
          other.operatorName == this.operatorName &&
          other.schematicId == this.schematicId &&
          other.duration == this.duration &&
          other.order == this.order &&
          other.priority == this.priority &&
          other.costManHour == this.costManHour &&
          other.start == this.start &&
          other.finish == this.finish &&
          other.progress == this.progress &&
          other.done == this.done &&
          other.project == this.project);
}

class TaskCompanion extends UpdateCompanion<TaskData> {
  final Value<int> id;
  final Value<int> operatorName;
  final Value<String> schematicId;
  final Value<int> duration;
  final Value<int> order;
  final Value<int> priority;
  final Value<int> costManHour;
  final Value<DateTime> start;
  final Value<DateTime> finish;
  final Value<int> progress;
  final Value<bool> done;
  final Value<int> project;
  const TaskCompanion({
    this.id = const Value.absent(),
    this.operatorName = const Value.absent(),
    this.schematicId = const Value.absent(),
    this.duration = const Value.absent(),
    this.order = const Value.absent(),
    this.priority = const Value.absent(),
    this.costManHour = const Value.absent(),
    this.start = const Value.absent(),
    this.finish = const Value.absent(),
    this.progress = const Value.absent(),
    this.done = const Value.absent(),
    this.project = const Value.absent(),
  });
  TaskCompanion.insert({
    this.id = const Value.absent(),
    required int operatorName,
    required String schematicId,
    required int duration,
    required int order,
    required int priority,
    required int costManHour,
    required DateTime start,
    required DateTime finish,
    required int progress,
    required bool done,
    required int project,
  })  : operatorName = Value(operatorName),
        schematicId = Value(schematicId),
        duration = Value(duration),
        order = Value(order),
        priority = Value(priority),
        costManHour = Value(costManHour),
        start = Value(start),
        finish = Value(finish),
        progress = Value(progress),
        done = Value(done),
        project = Value(project);
  static Insertable<TaskData> custom({
    Expression<int>? id,
    Expression<int>? operatorName,
    Expression<String>? schematicId,
    Expression<int>? duration,
    Expression<int>? order,
    Expression<int>? priority,
    Expression<int>? costManHour,
    Expression<DateTime>? start,
    Expression<DateTime>? finish,
    Expression<int>? progress,
    Expression<bool>? done,
    Expression<int>? project,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (operatorName != null) 'operator_name': operatorName,
      if (schematicId != null) 'schematic_id': schematicId,
      if (duration != null) 'duration': duration,
      if (order != null) 'order': order,
      if (priority != null) 'priority': priority,
      if (costManHour != null) 'cost_man_hour': costManHour,
      if (start != null) 'start': start,
      if (finish != null) 'finish': finish,
      if (progress != null) 'progress': progress,
      if (done != null) 'done': done,
      if (project != null) 'project': project,
    });
  }

  TaskCompanion copyWith(
      {Value<int>? id,
      Value<int>? operatorName,
      Value<String>? schematicId,
      Value<int>? duration,
      Value<int>? order,
      Value<int>? priority,
      Value<int>? costManHour,
      Value<DateTime>? start,
      Value<DateTime>? finish,
      Value<int>? progress,
      Value<bool>? done,
      Value<int>? project}) {
    return TaskCompanion(
      id: id ?? this.id,
      operatorName: operatorName ?? this.operatorName,
      schematicId: schematicId ?? this.schematicId,
      duration: duration ?? this.duration,
      order: order ?? this.order,
      priority: priority ?? this.priority,
      costManHour: costManHour ?? this.costManHour,
      start: start ?? this.start,
      finish: finish ?? this.finish,
      progress: progress ?? this.progress,
      done: done ?? this.done,
      project: project ?? this.project,
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
    if (schematicId.present) {
      map['schematic_id'] = Variable<String>(schematicId.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskCompanion(')
          ..write('id: $id, ')
          ..write('operatorName: $operatorName, ')
          ..write('schematicId: $schematicId, ')
          ..write('duration: $duration, ')
          ..write('order: $order, ')
          ..write('priority: $priority, ')
          ..write('costManHour: $costManHour, ')
          ..write('start: $start, ')
          ..write('finish: $finish, ')
          ..write('progress: $progress, ')
          ..write('done: $done, ')
          ..write('project: $project')
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
