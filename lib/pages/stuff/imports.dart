import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_ceo/models/branch_model.dart';
import 'package:grand_edu_ceo/models/reception_model.dart';
import 'package:grand_edu_ceo/models/support_model.dart';
import 'package:grand_edu_ceo/pages/login/constants.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/add_branch/imports.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/add_reception/imports.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/add_support/imports.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/reception_detail/imports.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/support_detail/imports.dart';
import 'package:grand_edu_ceo/pages/stuff/inner/teacher_detail/imports.dart';
import 'package:grand_edu_ceo/services/fb_service.dart';
import 'package:grand_edu_ceo/utils/lan.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/teacher_model.dart';
import '../../utils/titles.dart';
import '../../utils/utils.dart';
import 'inner/add_teacher/imports.dart';

part 'items.dart';
part 'page.dart';
part 'vm.dart';