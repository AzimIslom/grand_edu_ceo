import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_ceo/models/group_model.dart';
import 'package:grand_edu_ceo/models/student_model.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

import '../../../../models/branch_model.dart';
import '../../../../models/teacher_model.dart';
import '../../../../services/fb_service.dart';
import '../../../../utils/lan.dart';
import '../../../../utils/titles.dart';
import '../../../../utils/utils.dart';
import '../../../group/inner/add_group/imports.dart';
import '../../../login/constants.dart';

part 'items.dart';
part 'page.dart';
part 'vm.dart';