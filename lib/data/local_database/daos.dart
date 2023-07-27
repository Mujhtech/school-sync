part of 'database.dart';

@DriftAccessor(tables: <Type>[Users])
class UsersDao extends DatabaseAccessor<Database> with _$UsersDaoMixin {
  UsersDao(super.db);

  Future<UserEntity> createUser(String id, AccountEntity account) async =>
      into(users)
          .insertReturning(
            UsersCompanion.insert(
              id: DBValue(id),
              createdAt: clock.now(),
              updatedAt: DBValue(clock.now()),
              firstName: account.firstName!,
              lastName: account.lastName!,
              phoneNumber: account.phoneNumber!,
              email: account.email,
            ),
          )
          .then(_mapUserDataModel);

  Future<UserEntity?> getSingleUser(String id) async =>
      (select(users)..where((_) => _.id.equals(id)))
          .map(_mapUserDataModel)
          .getSingleOrNull();

  UserEntity _mapUserDataModel(UserDataModel user) =>
      user.toEntity(users.actualTableName);
}

@DriftAccessor(tables: <Type>[SyncLogs])
class SyncLogsDao extends DatabaseAccessor<Database> with _$SyncLogsDaoMixin {
  SyncLogsDao(super.db);

  Future<SyncLogEntity> createLog({
    required String type,
    required String record,
    required String? recordId,
    required String? schoolId,
    required String? userId,
  }) async =>
      into(syncLogs)
          .insertReturning(
            SyncLogsCompanion.insert(
              createdAt: clock.now(),
              updatedAt: DBValue(clock.now()),
              type: type,
              record: record,
              recordId: DBValue(recordId),
              userId: DBValue(userId),
              schoolId: DBValue(schoolId),
            ),
          )
          .then(_mapSyncLogDataModel);

  Future<SyncLogEntity?> getSingleLog(String id) async =>
      (select(syncLogs)..where((_) => _.id.equals(id)))
          .map(_mapSyncLogDataModel)
          .getSingleOrNull();

  SyncLogEntity _mapSyncLogDataModel(SyncLogDataModel log) =>
      log.toEntity(syncLogs.actualTableName);
}

@DriftAccessor(tables: <Type>[Schools])
class SchoolsDao extends DatabaseAccessor<Database> with _$SchoolsDaoMixin {
  SchoolsDao(super.db);

  // Stream<SchoolEntity?> watchActiveBudget() => (select(schools)
  //       ..where((_) => _.active.equals(true))
  //       ..limit(1))
  //     .map((_) => _.toEntity(budgets.actualTableName))
  //     .watchSingleOrNull();

  Stream<SchoolEntity> watchSingle(String id) => (select(schools)
        ..where((_) => _.id.equals(id))
        ..where((_) => _.deletedAt.equalsNullable(null))
        ..limit(1))
      .map((_) => _.toEntity(schools.actualTableName))
      .watchSingle();

  Stream<SchoolEntityList> watchAll(String userId) => (select(schools)
        ..where((_) => _.userId.equals(userId))
        ..where((_) => _.deletedAt.equalsNullable(null)))
      .map((_) => _.toEntity(schools.actualTableName))
      .watch();

  Future<bool> deleteSchool(String id) async =>
      (update(schools)..where((_) => _.id.equals(id)))
          .write(
            SchoolsCompanion(
              deletedAt: DBValue(clock.now()),
            ),
          )
          .then((_) => true);
  //(delete(schools)..where((_) => _.id.equals(id))).go().then((_) => true);

  Future<bool> updateSchool(UpdateSchooData school) async =>
      (update(schools)..where((_) => _.id.equals(school.id)))
          .write(
            SchoolsCompanion(
              name: DBValue(school.name),
              logo: DBValue(school.logo),
              email: DBValue(school.email),
              schoolType: DBValue(school.schoolType),
              address: DBValue(school.address),
              acronyms: DBValue(school.acronyms),
              latitude: DBValue(school.latitude),
              longitude: DBValue(school.longitude),
              updatedAt: DBValue(clock.now()),
            ),
          )
          .then((_) => true);

  Future<SchoolEntity> createSchool(CreateSchoolData school) async =>
      into(schools)
          .insertReturning(
            SchoolsCompanion.insert(
              id: school.id != null
                  ? DBValue(school.id!)
                  : const DBValue.absent(),
              name: school.name,
              userId: school.userId,
              schoolType: school.schoolType,
              logo: DBValue(school.logo),
              email: DBValue(school.email),
              address: DBValue(school.address),
              acronyms: DBValue(school.acronyms),
              latitude: DBValue(school.latitude),
              longitude: DBValue(school.longitude),
              createdAt: clock.now(),
            ),
          )
          .then((_) => _.toEntity(schools.actualTableName));
}

// @DriftAccessor(tables: <Type>[BudgetPlans, BudgetCategories])
// class BudgetPlansDao extends DatabaseAccessor<Database>
//     with _$BudgetPlansDaoMixin {
//   BudgetPlansDao(super.db);

//   Stream<BudgetPlanEntity> watchSingleBudgetPlan(String id) =>
//       (select(budgetPlans)..where((_) => _.id.equals(id)))
//           .join(<DBJoin>[
//             innerJoin(budgetCategories,
//                 budgetCategories.id.equalsExp(budgetPlans.category)),
//           ])
//           .map(_mapRowToEntity)
//           .watchSingle();

//   Stream<BudgetPlanEntityList> watchAllBudgetPlans() => select(budgetPlans)
//       .join(<DBJoin>[
//         innerJoin(budgetCategories,
//             budgetCategories.id.equalsExp(budgetPlans.category)),
//       ])
//       .map(_mapRowToEntity)
//       .watch();

//   Stream<BudgetPlanEntityList> watchAllBudgetPlansByCategory(String id) =>
//       (select(budgetPlans)..where((_) => _.category.equals(id)))
//           .join(<DBJoin>[
//             innerJoin(budgetCategories,
//                 budgetCategories.id.equalsExp(budgetPlans.category)),
//           ])
//           .map(_mapRowToEntity)
//           .watch();

//   Future<bool> deletePlan(String id) async =>
//       (delete(budgetPlans)..where((_) => _.id.equals(id)))
//           .go()
//           .then((_) => true);

//   Future<bool> updatePlan(UpdateBudgetPlanData plan) async =>
//       (update(budgetPlans)..where((_) => _.id.equals(plan.id)))
//           .write(
//             BudgetPlansCompanion(
//               title: DBValue(plan.title),
//               description: DBValue(plan.description),
//               category: DBValue(plan.category.id),
//               updatedAt: DBValue(clock.now()),
//             ),
//           )
//           .then((_) => true);

//   Future<String> createPlan(CreateBudgetPlanData plan) async =>
//       into(budgetPlans)
//           .insertReturning(
//             BudgetPlansCompanion.insert(
//               title: plan.title,
//               description: plan.description,
//               category: plan.category.id,
//               createdAt: clock.now(),
//             ),
//           )
//           .then((_) => _.id);

//   BudgetPlanEntity _mapRowToEntity(TypedResult row) {
//     final BudgetPlanDataModel plan = row.readTable(budgetPlans);
//     final BudgetCategoryDataModel category = row.readTable(budgetCategories);

//     return plan.toEntity(
//       tableName: budgetPlans.actualTableName,
//       category: (budgetCategories.actualTableName, category),
//     );
//   }
// }

// @DriftAccessor(tables: <Type>[BudgetCategories])
// class BudgetCategoriesDao extends DatabaseAccessor<Database>
//     with _$BudgetCategoriesDaoMixin {
//   BudgetCategoriesDao(super.db);

//   Stream<BudgetCategoryEntityList> watchAllBudgetCategories() =>
//       select(budgetCategories)
//           .map((_) => _.toEntity(budgetCategories.actualTableName))
//           .watch();

//   Future<bool> deleteCategory(String id) async =>
//       (delete(budgetCategories)..where((_) => _.id.equals(id)))
//           .go()
//           .then((_) => true);

//   Future<bool> updateCategory(UpdateBudgetCategoryData category) async =>
//       (update(budgetCategories)..where((_) => _.id.equals(category.id)))
//           .write(
//             BudgetCategoriesCompanion(
//               title: DBValue(category.title),
//               description: DBValue(category.description),
//               iconIndex: DBValue(category.iconIndex),
//               colorSchemeIndex: DBValue(category.colorSchemeIndex),
//               updatedAt: DBValue(clock.now()),
//             ),
//           )
//           .then((_) => true);

//   Future<BudgetCategoryEntity> createCategory(
//           CreateBudgetCategoryData category) async =>
//       into(budgetCategories)
//           .insertReturning(
//             BudgetCategoriesCompanion.insert(
//               title: category.title,
//               description: category.description,
//               iconIndex: category.iconIndex,
//               colorSchemeIndex: category.colorSchemeIndex,
//               createdAt: clock.now(),
//             ),
//           )
//           .then((_) => _.toEntity(budgetCategories.actualTableName));
// }

// @DriftAccessor(
//     tables: <Type>[Budgets, BudgetPlans, BudgetCategories, BudgetAllocations])
// class BudgetAllocationsDao extends DatabaseAccessor<Database>
//     with _$BudgetAllocationsDaoMixin {
//   BudgetAllocationsDao(super.db);

//   Stream<BudgetAllocationEntity> watchSingleBudgetPlan({
//     required String budgetId,
//     required String planId,
//   }) =>
//       (select(budgetAllocations)
//             ..where((_) => _.budget.equals(budgetId) & _.plan.equals(planId)))
//           .join(<DBJoin>[
//             innerJoin(budgets, budgets.id.equalsExp(budgetAllocations.budget)),
//             innerJoin(
//                 budgetPlans, budgetPlans.id.equalsExp(budgetAllocations.plan)),
//           ])
//           .watchSingle()
//           .switchMap((TypedResult row) {
//             final BudgetPlanDataModel plan = row.readTable(budgetPlans);
//             return (select(budgetCategories)
//                   ..where((_) => _.id.equals(plan.id)))
//                 .watchSingle()
//                 .map(
//                   (BudgetCategoryDataModel category) => _mapRowToEntity(
//                     row,
//                     <String, BudgetCategoryDataModel>{
//                       category.id: category,
//                     },
//                   ),
//                 );
//           });

//   Stream<BudgetAllocationEntityList> watchAllBudgetAllocations() =>
//       _selectAll(select(budgetAllocations));

//   Stream<BudgetAllocationEntityList> watchAllBudgetAllocationsByBudget(
//           String id) =>
//       _selectAll(select(budgetAllocations)..where((_) => _.budget.equals(id)));

//   Stream<BudgetAllocationEntityList> watchAllBudgetAllocationsByPlan(
//           String id) =>
//       _selectAll(select(budgetAllocations)..where((_) => _.plan.equals(id)));

//   Future<bool> deleteAllocation(String id) async =>
//       (delete(budgetAllocations)..where((_) => _.id.equals(id)))
//           .go()
//           .then((_) => true);

//   Future<bool> deleteAllocationByPlan(String id) async =>
//       (delete(budgetAllocations)..where((_) => _.plan.equals(id)))
//           .go()
//           .then((_) => true);

//   Future<bool> updateAllocation(UpdateBudgetAllocationData allocation) async =>
//       (update(budgetAllocations)..where((_) => _.id.equals(allocation.id)))
//           .write(
//             BudgetAllocationsCompanion(
//               amount: DBValue(allocation.amount),
//             ),
//           )
//           .then((_) => true);

//   Future<bool> createAllocations(
//           List<CreateBudgetAllocationData> allocations) async =>
//       budgetAllocations
//           .insertAll(allocations.map(_mapToInsertData))
//           .then((_) => true);

//   Future<String> createAllocation(
//           CreateBudgetAllocationData allocation) async =>
//       into(budgetAllocations)
//           .insertReturning(_mapToInsertData(allocation))
//           .then((_) => _.id);

//   Stream<BudgetAllocationEntityList> _selectAll(
//           SimpleSelectStatement<$BudgetAllocationsTable, Object?> query) =>
//       query
//           .join(<DBJoin>[
//             innerJoin(budgets, budgets.id.equalsExp(budgetAllocations.budget)),
//             innerJoin(
//                 budgetPlans, budgetPlans.id.equalsExp(budgetAllocations.plan)),
//           ])
//           .watch()
//           .switchMap(_mapToEntityListStream);

//   Stream<BudgetAllocationEntityList> _mapToEntityListStream(
//           List<TypedResult> rows) =>
//       select(budgetCategories).watch().map((_) {
//         final Map<String, BudgetCategoryDataModel> categoryById =
//             _.foldToMap((_) => _.id);

//         return rows
//             .map((_) => _mapRowToEntity(_, categoryById))
//             .toList(growable: false);
//       });

//   BudgetAllocationEntity _mapRowToEntity(
//       TypedResult row, Map<String, BudgetCategoryDataModel> categoryById) {
//     final BudgetAllocationDataModel allocation =
//         row.readTable(budgetAllocations);
//     final BudgetDataModel budget = row.readTable(budgets);
//     final BudgetPlanDataModel plan = row.readTable(budgetPlans);

//     return allocation.toEntity(
//       tableName: budgetAllocations.actualTableName,
//       budget: (budgets.actualTableName, budget),
//       plan: (budgetPlans.actualTableName, plan),
//       category: (
//         budgetCategories.actualTableName,
//         categoryById[plan.category]!
//       ),
//     );
//   }

//   Insertable<BudgetAllocationDataModel> _mapToInsertData(
//       CreateBudgetAllocationData allocation) {
//     return BudgetAllocationsCompanion.insert(
//       amount: allocation.amount,
//       budget: allocation.budget.id,
//       plan: allocation.plan.id,
//       createdAt: clock.now(),
//     );
//   }
// }

// @DriftAccessor(tables: <Type>[
//   BudgetMetadataKeys,
//   BudgetMetadataValues,
//   BudgetMetadataAssociations
// ])
// class BudgetMetadataDao extends DatabaseAccessor<Database>
//     with _$BudgetMetadataDaoMixin {
//   BudgetMetadataDao(super.db);

//   Stream<BudgetMetadataValueEntityList> watchAllBudgetMetadataValues() =>
//       select(budgetMetadataValues)
//           .join(<DBJoin>[
//             innerJoin(budgetMetadataKeys,
//                 budgetMetadataKeys.id.equalsExp(budgetMetadataValues.key)),
//           ])
//           .map(_mapValueRowToEntity)
//           .watch();

//   Stream<BudgetMetadataValueEntityList> watchAllBudgetMetadataValuesByPlan(
//           String planId) =>
//       (select(budgetMetadataAssociations)..where((_) => _.plan.equals(planId)))
//           .join(<DBJoin>[
//             innerJoin(
//                 budgetMetadataValues,
//                 budgetMetadataValues.id
//                     .equalsExp(budgetMetadataAssociations.metadata)),
//             innerJoin(budgetMetadataKeys,
//                 budgetMetadataKeys.id.equalsExp(budgetMetadataValues.key)),
//           ])
//           .map(_mapValueRowToEntity)
//           .watch();

//   Stream<List<ReferenceEntity>> watchAllBudgetPlansByMetadata(
//           String metadataId) =>
//       (select(budgetMetadataAssociations)
//             ..where((_) => _.metadata.equals(metadataId)))
//           .map((_) => _.toPlanReferenceEntity(budgetPlans.actualTableName))
//           .watch();

//   Future<String> createMetadata(CreateBudgetMetadataData metadata) =>
//       transaction(() async {
//         final BudgetMetadataKeyDataModel key =
//             await into(budgetMetadataKeys).insertReturning(
//           BudgetMetadataKeysCompanion.insert(
//             title: metadata.title,
//             description: metadata.description,
//             createdAt: clock.now(),
//           ),
//         );

//         await _runOperations(key, metadata.operations);

//         return key.id;
//       });

//   Future<bool> updateMetadata(UpdateBudgetMetadataData metadata) =>
//       transaction(() async {
//         final BudgetMetadataKeyDataModel key = await (update(budgetMetadataKeys)
//               ..where((_) => _.id.equals(metadata.id)))
//             .writeReturning(
//               BudgetMetadataKeysCompanion(
//                 title: DBValue(metadata.title),
//                 description: DBValue(metadata.description),
//                 updatedAt: DBValue(clock.now()),
//               ),
//             )
//             .then((_) => _.single);

//         await _runOperations(key, metadata.operations);

//         return true;
//       });

//   Future<bool> addMetadataToPlan({
//     required ReferenceEntity plan,
//     required ReferenceEntity metadata,
//   }) async {
//     await into(budgetMetadataAssociations).insert(
//       BudgetMetadataAssociationsCompanion.insert(
//         plan: plan.id,
//         metadata: metadata.id,
//         createdAt: clock.now(),
//       ),
//     );
//     return true;
//   }

//   Future<bool> removeMetadataFromPlan({
//     required ReferenceEntity plan,
//     required ReferenceEntity metadata,
//   }) async {
//     await (delete(budgetMetadataAssociations)
//           ..where(
//               (_) => _.plan.equals(plan.id) & _.metadata.equals(metadata.id)))
//         .go();
//     return true;
//   }

//   Future<void> _runOperations(BudgetMetadataKeyDataModel key,
//           Set<BudgetMetadataValueOperation> operations) =>
//       Future.wait(<Future<void>>[
//         for (final BudgetMetadataValueOperation item in operations)
//           switch (item) {
//             BudgetMetadataValueCreationOperation() =>
//               into(budgetMetadataValues).insertReturning(
//                 BudgetMetadataValuesCompanion.insert(
//                   title: item.title,
//                   value: item.value,
//                   key: key.id,
//                   createdAt: clock.now(),
//                 ),
//               ),
//             BudgetMetadataValueModificationOperation() =>
//               (update(budgetMetadataValues)
//                     ..where((_) => _.id.equals(item.reference.id)))
//                   .write(
//                 BudgetMetadataValuesCompanion(
//                   title: DBValue(item.title),
//                   value: DBValue(item.value),
//                   updatedAt: DBValue(clock.now()),
//                 ),
//               ),
//             BudgetMetadataValueRemovalOperation() =>
//               (delete(budgetMetadataValues)
//                     ..where((_) => _.id.equals(item.reference.id)))
//                   .go(),
//           }
//       ]);

//   BudgetMetadataValueEntity _mapValueRowToEntity(TypedResult row) {
//     final BudgetMetadataValueDataModel metadataValue =
//         row.readTable(budgetMetadataValues);
//     final BudgetMetadataKeyDataModel metadataKey =
//         row.readTable(budgetMetadataKeys);

//     return metadataValue.toEntity(
//       tableName: budgetMetadataValues.actualTableName,
//       key: (budgetMetadataKeys.actualTableName, metadataKey),
//     );
//   }
// }
