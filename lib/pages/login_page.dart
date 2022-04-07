import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
//Valores para preenche formulário...

  bool isLogin = true;
  bool loading = false;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        // Lógica do botão "continuar" vai aqui...
      }
    });
  }

  login() async {
    setState(() => loading = true);
    // Lógica de autenticação vai aqui...
    // try {
    //   await context.read<AuthService>().login(email.text, senha.text);
    // } on AuthException catch (e) {
    //   setState(() => loading = false);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(e.message)));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem-vindo!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HelpTheme.helpWhiteIce,
                      fontSize: 40,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: email,
                      style: TextStyle(
                        color: HelpTheme.helpDarkGrey,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).canvasColor,
                        // errorText: errorText,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'Email',
                        hintStyle:
                            const TextStyle(color: HelpTheme.helpButtonText),
                        focusColor: HelpTheme.helpYellow,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: HelpTheme.helpYellow, width: 3.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: HelpTheme.helpErrorText, width: 3.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatório!';
                        } else if (!value.contains('@')) {
                          return 'Não é um email válido!';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 60,
                    child: TextFormField(
                      controller: senha,
                      obscureText: showPassword ? true : false,
                      style: TextStyle(
                        color: HelpTheme.helpDarkGrey,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).canvasColor,
                        // errorText: errorText,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'Senha',
                        hintStyle:
                            const TextStyle(color: HelpTheme.helpButtonText),
                        focusColor: HelpTheme.helpYellow,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: HelpTheme.helpYellow, width: 3.0),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: HelpTheme.helpErrorText, width: 3.0),
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(
                            showPassword == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: HelpTheme.helpYellow,
                          ),
                          onTap: () {
                            setState((() {
                              showPassword = !showPassword;
                            }));
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe sua senha!';
                        } else if (value.length < 12) {
                          return 'Sua senha deve ter no mínimo 12 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 50,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          //   if (isLogin) {
                          //     login();
                          //   }
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Continuar",
                              style: TextStyle(
                                color: HelpTheme.helpButtonText,
                                fontSize: 16,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(
                    "Ainda não possui uma conta?",
                    style: TextStyle(
                      color: HelpTheme.helpWhiteIce,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(
                      "Increva-se",
                      style: TextStyle(
                        color: HelpTheme.helpYellow,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(
                      "Esqueceu sua senha?",
                      style: TextStyle(
                        color: HelpTheme.helpYellow,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
