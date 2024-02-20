
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
  static const String picFullname = 'picFullname';
  static const String picContact = 'picContact';
  static const String picIcNumber = 'picIcNumber';
  static const String picAdress = 'picAdress';
  static const String picEmail = 'picEmail';
  static const String picPassword = 'picPassword';
  static const String askWho = 'askWho';
  static const String askWhoSubtitle = 'askWhoSubtitle';
  static const String askDonor = "askDonor";
  static const String askOrganizer = "askOrganizer";

  //Error handling
  static const String errorTitle = "errorTitle";
  static const String generalErrorMsg = "generalErrorMsg";
  static const String credentialErrorMsg = "credentialErrorMsg";
  static const String authenticationErrorMsg = "authenticationErrorMsg";
  static const String ok = "ok";

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
    next: 'Next',
    picFullname: 'PIC Fullname',
    picContact: 'Contact Number',
    picIcNumber: 'Ic Number',
    picAdress: 'Adress',
    picEmail: 'E-mail',
    picPassword: 'Password',
    askWho: 'Who are you?',
    askWhoSubtitle: 'What you want to be in the application',
    askDonor: 'Donor',
    askOrganizer: 'Organizer',

    //Error Handling
    errorTitle: 'Error',
    generalErrorMsg: 'An error occurred. Please try again.',
    credentialErrorMsg: 'Invalid credentials. Please try again.',
    authenticationErrorMsg: 'Authentication failed. Please try again later.',
    ok: 'Ok',


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
    next: 'Seterusnya',
    picFullname: 'Nama Penuh PIC',
    picContact: 'Nomber Contact',
    picIcNumber: 'Nombor IC',
    picAdress: 'Alamat',
    picEmail: 'E-mel',
    picPassword: 'Kata laluan',
    askWho: 'Siapakah Anda?',
    askWhoSubtitle: 'Apa yang anda ingin jadi?',
    askDonor: 'Penderma',
    askOrganizer: 'Organizer',

    //Error Handling
    errorTitle: 'Ralat',
    generalErrorMsg: 'Ralat berlaku. Sila cuba lagi.',
    credentialErrorMsg: 'Bukti kelayakan tidak sah. Sila cuba lagi.',
    authenticationErrorMsg: 'Pengesahan gagal. Sila cuba sebentar lagi.',
    ok: 'Baik',
    
  };
}