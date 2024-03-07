import 'dart:async';
import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:templat_project/data/periodic_table_data.dart';
import 'package:templat_project/models/models.dart';
import 'package:templat_project/pages/pages.dart';
import 'package:templat_project/utils/utils.dart';

import '../provider/providers.dart';

part 'simple_text.dart';
part 'text/formula_in_text.dart';
part 'searchs/search_element_delegate.dart';
part 'searchs/search_compund_by_type.dart';
part 'cards/element_card.dart';
part 'cards/compound_card.dart';
part 'cards/elements_list_tile.dart';
part 'cards/compound_list_tile.dart';
part 'cards/card_detail_compound.dart';
part 'cards/cards_elements_valences.dart';
part 'instruccions/compound_instruction.dart';
