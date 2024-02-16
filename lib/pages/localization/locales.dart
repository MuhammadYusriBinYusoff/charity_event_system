
import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en",Translation.EN),
  MapLocale("my",Translation.MY),
];


mixin Translation{
  //To declare backup text
  //For splashpage
  static const String splashTitle = 'SpiraCare';

  //For Homepage
  static const String title = 'title';
  static const String body = 'body';

  //For Loginpage
  static const String loginTitle = 'loginTitle';
  static const String loginEmail = 'loginEmail';
  static const String loginPassword = 'loginPassword';
  static const String loginQuestion = "loginQuestion?";

  //For Signup
  static const String signupTitle = 'signUpTitle';
  static const String organizationName = 'organizationName';
  static const String organizationContact = 'organizationContact';
  static const String organizationAdress = 'organizationAdress';
  static const String organizationLink = 'organizationLink';
  static const String next = 'next';

  static const Map<String,dynamic> EN = {
    //For Splashpage
    splashTitle: 'SpiraCare',

    //For Homepage
    title: 'Localization',
    body: 'Welcome to this test',

    //For Loginpage
    loginTitle: 'Log in',
    loginEmail: 'E-mail',
    loginPassword: 'Password',
    loginQuestion: 'Don’t have an account?',
    
    //For Signup page
    signupTitle: 'Sign-Up',
    organizationName: 'Organization Name',
    organizationContact: 'Organization Contact',
    organizationAdress: 'Adress',
    organizationLink: 'Website Link',
    next: 'Next'

  };

  static const Map<String,dynamic> MY = {
    //For Splashpage
    splashTitle: 'SpiraCare',

    //For Homepage
    title: 'Localisasi',
    body: 'Selamat datang ke test ini',

    //For Loginpage
    loginTitle: 'Log masuk',
    loginEmail: 'E-mel',
    loginPassword: 'Kata laluan',
    loginQuestion: 'Tiada akaun?',

    //For Signup page
    signupTitle: 'Pendaftaran',
    organizationName: 'Nama Organisasi',
    organizationContact: 'Hubungi Organisasi',
    organizationAdress: 'Alamat',
    organizationLink: 'Link Website',
    next: 'Seterusnya'
    
  };
}