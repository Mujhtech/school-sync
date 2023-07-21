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

// @DataClassName('AccountDataModel')
// class Accounts extends Table with _UniquePrimaryKey {}

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

// @DataClassName('BudgetAllocationDataModel')
// class BudgetAllocations extends Table
//     with _UniquePrimaryKey, _CreatedAtKey, _UpdatedAtKey {
//   IntColumn get amount => integer()();

//   TextColumn get budget => text().references(Budgets, #id)();

//   TextColumn get plan => text().references(BudgetPlans, #id)();
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
//   TextColumn get title => text()();

//   TextColumn get description => text()();
// }

mixin _CreatedAtKey on Table {
  DateTimeColumn get createdAt => dateTime()();
}

mixin _UpdatedAtKey on Table {
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

mixin _DeletedAtKey on Table {
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
