import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_integration/models/home/activity.dart';

// Necessary for code-generation to work
part 'activity_provider.g.dart';

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  final response =
      await http.get(Uri.parse('https://www.boredapi.com/api/activity'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;

  var activity = Activity.fromJson(json);
  log('Activity: $activity');
  return activity;
}
