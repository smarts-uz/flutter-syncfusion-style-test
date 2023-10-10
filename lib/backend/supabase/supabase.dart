import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://torthiwfsqwzbcveiimx.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRvcnRoaXdmc3F3emJjdmVpaW14Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MDkxODUsImV4cCI6MjAxMTQ4NTE4NX0.9FnyfQPJQ5puR_MQnK7RvwiBeuYy7DNjBZcVH1y3eOI';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
