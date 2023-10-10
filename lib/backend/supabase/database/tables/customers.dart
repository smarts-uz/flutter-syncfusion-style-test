import '../database.dart';

class CustomersTable extends SupabaseTable<CustomersRow> {
  @override
  String get tableName => 'customers';

  @override
  CustomersRow createRow(Map<String, dynamic> data) => CustomersRow(data);
}

class CustomersRow extends SupabaseDataRow {
  CustomersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CustomersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get job => getField<String>('job');
  set job(String? value) => setField<String>('job', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  int? get salary => getField<int>('salary');
  set salary(int? value) => setField<int>('salary', value);
}
