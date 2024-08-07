import 'dart:async';
import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:collection/collection.dart';
import 'package:flip_card/flip_card.dart';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:templat_project/constants/compund_colors.dart';
import 'package:templat_project/constants/constant.dart';
import 'package:templat_project/data/constants_elementes.dart';
import 'package:templat_project/data/periodic_table_data.dart';
import 'package:templat_project/models/models.dart';
import 'package:templat_project/pages/pages.dart';
import 'package:templat_project/provider/ad_provider.dart';
import 'package:templat_project/theme/colors.dart';
import 'package:templat_project/utils/utils.dart';

import '../provider/providers.dart';

part 'simple_text.dart';
part 'text/formula_in_text.dart';
part 'backgroud/scaffold_background.dart';
part 'searchs/search_element_delegate.dart';
part 'searchs/search_compund_by_type.dart';
part 'cards/element_card.dart';
part 'cards/compound_card.dart';
part 'cards/elements_list_tile.dart';
part 'cards/compound_list_tile.dart';
part 'cards/compound_list_simple.dart';
part 'cards/card_detail_compound.dart';
part 'cards/cards_elements_valences.dart';
part 'cards/card_instruction_container.dart';
part 'cards/card_sales.dart';
part 'share/main_app_bar.dart';
part 'cards/circle_presentation.dart';
part 'cards/card_select_option.dart';
part 'ads/banner_ad.dart';
part 'instruccions/compound_instruction.dart';
part 'instruccions/plus_2_elements.dart';
part 'instruccions/groups_chips.dart';
part 'games_widgets/progres_linear_timer.dart';
part 'cards/card_detail_complete.dart';
