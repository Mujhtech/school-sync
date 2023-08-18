part of 'database.dart';

const Uuid _uuid = Uuid();

@optionalTypeArgs
typedef DBValue<T> = Value<T>;
typedef DBJoin = Join<HasResultSet, Object?>;

@DataClassName('UserDataModel')
class Users extends Table
    with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey, _DeletedAtKey {
  TextColumn get email => text()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get phoneNumber => text()();
}

@DataClassName('SyncLogDataModel')
class SyncLogs extends Table
    with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey, _DeletedAtKey {
  TextColumn get userId => text().nullable()();

  TextColumn get schoolId => text().nullable()();

  TextColumn get recordId => text().nullable()();

  TextColumn get type => text()();

  TextColumn get record => text()();
}

@DataClassName('SchoolDataModel')
class Schools extends Table
    with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey, _DeletedAtKey {
  TextColumn get userId => text()();

  TextColumn get logo => text().nullable()();

  TextColumn get email => text().nullable()();

  TextColumn get address => text().nullable()();

  TextColumn get acronyms => text().nullable()();

  RealColumn get latitude => real().nullable()();

  RealColumn get longitude => real().nullable()();

  TextColumn get schoolType => text()();

  TextColumn get name => text()();
}

@DataClassName('ClassModel')
class Classes extends Table
    with
        _UniquePrimaryKey,
        _SchoolIdKey,
        _CreatedAtKey,
        _UpdatedAtKey,
        _DeletedAtKey {
  TextColumn get name => text()();

  TextColumn get code => text().nullable()();
}

@DataClassName('SessionModel')
class Sessions extends Table
    with
        _UniquePrimaryKey,
        _SchoolIdKey,
        _CreatedAtKey,
        _UpdatedAtKey,
        _DeletedAtKey {
  TextColumn get name => text()();

  TextColumn get code => text().nullable()();
}

@DataClassName('SubjectModel')
class Subjects extends Table
    with
        _UniquePrimaryKey,
        _SchoolIdKey,
        _CreatedAtKey,
        _UpdatedAtKey,
        _DeletedAtKey {
  TextColumn get title => text()();

  TextColumn get code => text().nullable()();

  IntColumn get unit => integer().nullable()();
}

@DataClassName('ParentModel')
class Parents extends Table
    with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey, _DeletedAtKey {
  TextColumn get name => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phoneNumber => text().nullable()();
  TextColumn get address => text().nullable()();
}

@DataClassName('StudentModel')
class Students extends Table
    with
        _UniquePrimaryKey,
        _SchoolIdKey,
        _FullNameKey,
        _CreatedAtKey,
        _UpdatedAtKey,
        _DeletedAtKey {
  DateTimeColumn get dateOfBirth => dateTime().nullable()();
  DateTimeColumn get enrollmentDate => dateTime().nullable()();
  BoolColumn get isGraduated => boolean()();
  DateTimeColumn get graduationDate => dateTime().nullable()();

  TextColumn get parentId => text().references(Parents, #id)();
}

@DataClassName('StaffModel')
class Staffs extends Table
    with
        _UniquePrimaryKey,
        _SchoolIdKey,
        _FullNameKey,
        _CreatedAtKey,
        _UpdatedAtKey,
        _DeletedAtKey {
  TextColumn get email => text()();
}

// @DataClassName('BudgetDataModel')
// class Budgets extends Table
//     with
//         _UniquePrimaryKey,
//         _TitleDescriptionKeys,
//         _CreatedAtKey,
//         _UpdatedAtKey {
//   IntColumn get index => integer()();

//   IntColumn get amount => integer()();

//   BoolColumn get active => boolean()();

//   DateTimeColumn get startedAt => dateTime()();

//   DateTimeColumn get endedAt => dateTime().nullable()();
// }

// @DataClassName('BudgetPlanDataModel')
// class BudgetPlans extends Table
//     with
//         _UniquePrimaryKey,
//         _TitleDescriptionKeys,
//         _CreatedAtKey,
//         _UpdatedAtKey {
//   TextColumn get category => text().references(BudgetCategories, #id)();
// }

// @DataClassName('BudgetCategoryDataModel')
// class BudgetCategories extends Table
//     with
//         _UniquePrimaryKey,
//         _TitleDescriptionKeys,
//         _CreatedAtKey,
//         _UpdatedAtKey {
//   IntColumn get iconIndex => integer()();

//   IntColumn get colorSchemeIndex => integer()();
// }

// @DataClassName('BudgetMetadataKeyDataModel')
// class BudgetMetadataKeys extends Table
//     with
//         _UniquePrimaryKey,
//         _TitleDescriptionKeys,
//         _CreatedAtKey,
//         _UpdatedAtKey {}

// @DataClassName('BudgetMetadataValueDataModel')
// class BudgetMetadataValues extends Table
//     with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey {
//   TextColumn get title => text()();

//   TextColumn get key => text().references(BudgetMetadataKeys, #id)();

//   TextColumn get value => text()();
// }

// @DataClassName('BudgetMetadataAssociationDataModel')
// class BudgetMetadataAssociations extends Table
//     with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey {
//   TextColumn get plan => text().references(BudgetPlans, #id)();

//   TextColumn get metadata => text().references(BudgetMetadataValues, #id)();
// }

mixin _UniquePrimaryKey on Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

// mixin _TitleDescriptionKeys on Table {

// }

mixin _SchoolIdKey on Table {
  TextColumn get schoolId => text().references(Schools, #id)();
}

mixin _FullNameKey on Table {
  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get middleName => text().nullable()();
}

mixin _CreatedAtKey on Table {
  DateTimeColumn get createdAt => dateTime()();
}

mixin _UpdatedAtKey on Table {
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

mixin _DeletedAtKey on Table {
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
