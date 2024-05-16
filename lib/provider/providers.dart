import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:templat_project/models/models.dart';
import 'package:riverpod/riverpod.dart';
import 'package:templat_project/services/services.dart';
import 'package:templat_project/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/periodic_table_data.dart';
import '../theme/theme.dart';

part 'theme_provider.dart';
part '1compounds_provider.dart';
part 'compounds_providers.dart';
part 'global_provider.dart';
part 'notification_provider.dart';
/* part 'firebase_remote_config.dart'; */
