// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jlpt_app/features/home/presentation/pages/home_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    // GoRoute(
    //   path: '/paper/:id',
    //   builder: (context, state) => PaperScreen(
    //     paperId: int.parse(state.pathParameters['id']!),
    //   ),
    // ),
    // GoRoute(
    //   path: '/paper/:id/exam',
    //   builder: (context, state) => ExamScreen(
    //     paperId: state.pathParameters['id']!,
    //   ),
    // ),
    // GoRoute(
    //   path: '/paper/:id/result',
    //   builder: (context, state) => ResultScreen(
    //     paperId: state.pathParameters['id']!,
    //   ),
    // ),
  ],
);
