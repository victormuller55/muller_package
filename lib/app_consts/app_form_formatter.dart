import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppFormFormatters {
  static MaskTextInputFormatter cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter dateFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter hourFormatter = MaskTextInputFormatter(mask: '##:##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter cnpjFormatter = MaskTextInputFormatter(mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter nfeFormatter = MaskTextInputFormatter(mask: '#### #### #### #### #### #### #### #### #### #### ####', filter: {"#": RegExp(r'[0-9A-Za-z]')});
  static MaskTextInputFormatter phoneFormatter = MaskTextInputFormatter(mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter realFormatter = MaskTextInputFormatter(mask: 'R\$ ###.###.###,##', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter porcentagemFormatter = MaskTextInputFormatter(mask: '##%', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter diasFormatter = MaskTextInputFormatter(mask: '## dias', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter idFormatter = MaskTextInputFormatter(mask: '###-###', filter: {"#": RegExp(r'[0-9]')});
  static MaskTextInputFormatter cepFormatter = MaskTextInputFormatter(mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});
}
 // 83709-320