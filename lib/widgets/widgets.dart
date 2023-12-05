import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:templat_project/data/periodic_table_data.dart';
import 'package:templat_project/pages/pages.dart';
import 'package:templat_project/utils/search_utils.dart';

import '../provider/providers.dart';

part 'simple_text.dart';
part 'searchs/search_element_delegate.dart';
part 'cards/element_card.dart';
