import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:collection/collection.dart';
import 'dart:math' as math;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:roulette/roulette.dart' as roulette2;
import 'package:shake/shake.dart';
import 'package:templat_project/anim/custom_icons/custom_icons.dart';

import 'package:templat_project/buttons/buttons.dart';
import 'package:templat_project/constants/compund_colors.dart';
import 'package:templat_project/constants/constant.dart';
import 'package:templat_project/constants/games_constants.dart';
import 'package:templat_project/data/constants_elementes.dart';
import 'package:templat_project/data/elements_data.dart';
import 'package:templat_project/data/periodic_table_data.dart';
import 'package:templat_project/models/models.dart';
import 'package:templat_project/notifications/snackbar.dart';
import 'package:templat_project/provider/ad_provider.dart';
import 'package:templat_project/provider/providers.dart';
import 'package:templat_project/services/firebase/remote_config.dart';
import 'package:templat_project/services/services.dart';
import 'package:templat_project/theme/colors.dart';
import 'package:templat_project/widgets/widgets.dart';
import 'package:templat_project/utils/utils.dart';
part 'home_page.dart';
part 'games/games_page.dart';
part 'games/elements_shake.dart';

part 'elements_page.dart';
part 'elements/elements_detail.dart';
part 'elements/elements_complete_detail.dart';
part 'introduction/introduction_page.dart';

part 'compounds/compounds_page.dart';
part 'compounds/sales/sales_neutras.dart';
part 'compounds/sales/sales_dobles.dart';
part 'compounds/sales/sales_basicas.dart';
part 'compounds/sales/sales_hidracidas.dart';

part 'compounds/compound_detail_page.dart';
part 'compounds/compounds_by_type_page.dart';
part 'animation_test.dart';
part 'games/guess_periodic_element.dart';
part 'games/guess_compound_game.dart';
part 'games/guess_type_compound_game.dart';
part 'games/routelle_example.dart';
part 'perodice_table/periodic_table_page.dart';
part 'test/tab_view_custom.dart';
part 'test/test_page.dart';
part 'test/login_page.dart';
part 'test/test_home_page.dart';

part 'games/result_page.dart';
