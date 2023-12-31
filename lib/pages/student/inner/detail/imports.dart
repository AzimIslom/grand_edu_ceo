import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_ceo/models/group_model.dart';
import 'package:grand_edu_ceo/models/student_model.dart';
import 'package:grand_edu_ceo/models/teacher_model.dart';
import 'package:grand_edu_ceo/pages/login/constants.dart';
import 'package:grand_edu_ceo/pages/student/inner/payments/imports.dart';
import 'package:grand_edu_ceo/pages/student/inner/table/imports.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../../services/fb_service.dart';
import '../../../../utils/lan.dart';
import '../../../../utils/titles.dart';
import '../../../../utils/utils.dart';
import '../../../group/imports.dart';
import 'chart.dart';
part 'items.dart';
part 'page.dart';
part 'vm.dart';