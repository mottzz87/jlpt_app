import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../services/supabase_service.dart';

final userProvider = FutureProvider<supabase.User?>((ref) async {
  final supabaseService = SupabaseService();
  return supabaseService.client.auth.currentUser;
});
