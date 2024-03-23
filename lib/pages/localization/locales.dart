
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
  static const String personnelName = "personnelName";
  static const String personnelContact = "personnelContact";
  static const String personnelIc = "personnelIc";
  static const String personnelAdress = "personnelAdress";
  static const String personnelEmail = "personnelEmail";
  static const String personnelPassword = "personnelPassword";

  //Error handling
  static const String errorTitle = "errorTitle";
  static const String generalErrorMsg = "generalErrorMsg";
  static const String credentialErrorMsg = "credentialErrorMsg";
  static const String authenticationErrorMsg = "authenticationErrorMsg";
  static const String ok = "ok";

  //General things
  static const String logOutTitle = "logOutTitle";
  static const String logOutMsg = "logOutMsg";
  static const String cancel = "cancel";
  static const String logout = "logout";
  static const String save = "save";
  static const String submit = "submit";
  static const String insert = "insert";

  //Homepage
  static const String charity2024Title = 'charity2024';
  static const String charity2024Subtitle = 'charity2024Subtitle';
  static const String myEventTitle = "myEventTitle";
  static const String myEventSubtitle = "myEventSubtitle";
  static const String pleaseHintText = "pleaseHintText";

  //Event
  static const String createEventTitle = 'createEventTitle';
  static const String createEventSubtitle = 'createEventSubtitle';
  static const String eventTitle = 'eventTitle';
  static const String eventDescription = 'eventDescription';
  static const String photoPosting ='photoPhosting';
  static const String itemName = 'itemName';
  static const String itemQuantity = 'itemQuantity';
  static const String itemUnit = 'itemUnit';
  static const String itemDate = 'itemDate';
  static const String donationTarget = 'donationTarget';
  static const String donationCurrent = 'donationCurrent';
  static const String donationStartDate = 'donationStartDate';
  static const String donationEndDate = 'donationEndDate';
  static const String donationBankAccount = 'donationBankAccount';
  static const String uploadGalleryImage = 'uploadGalleryImage';
  static const String showGalleryImage = 'showGalleryImage';
  static const String spiralCareDisclaimer = 'spiralCareDisclaimer';
  static const String volunteerRegisterTitle = 'volunteerRegisterTitle';
  static const String itemRequestTitle = 'itemRequestTitle';
  

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
    personnelName: 'Fullname',
    personnelContact: 'Contact',
    personnelIc: 'Ic Number',
    personnelAdress: 'Adress',
    personnelEmail: 'E-mail',
    personnelPassword: 'Password',

    //Error Handling
    errorTitle: 'Error',
    generalErrorMsg: 'An error occurred. Please try again.',
    credentialErrorMsg: 'Invalid credentials. Please try again.',
    authenticationErrorMsg: 'Authentication failed. Please try again later.',
    ok: 'Ok',

    //General things
    logOutTitle: 'Log Out',
    logOutMsg: 'Are you sure you want to log out?',
    logout: 'Log Out',
    cancel: 'Cancel',
    pleaseHintText: 'Please write here',
    save: 'Save',
    submit: 'Submit',
    insert: 'Insert',

    //Homepage
    charity2024Title: 'Charity Event 2024',
    charity2024Subtitle: 'Collection of activity from organizer',
    myEventTitle: 'My Event',
    myEventSubtitle: 'Organizer can create their event here',

    //Event
    createEventTitle: 'Create new event',
    createEventSubtitle: 'Tap to add new file',
    eventTitle: 'Event Title',
    eventDescription: 'Event Description',
    photoPosting: 'Event Banner',
    itemName: 'Item Name',
    itemQuantity: 'Quantity',
    itemUnit: 'Unit',
    itemDate: 'Date',
    donationTarget: 'Target Money',
    donationCurrent: 'Current Collected',
    donationStartDate: 'Start Date',
    donationEndDate: 'End Date',
    donationBankAccount: 'Bank Account',
    uploadGalleryImage: 'Upload Gallery Image',
    showGalleryImage: 'Gallery',
    spiralCareDisclaimer: "Spiral Care Disclaimer: Hi, I'm Muhammad Yusri Bin Yusoff, owner of the Spiral Care application. On behalf of the event organizers, we're seeking your support. Rest assured, all organizations registered in our app undergo thorough background checks and approval by Spiral Care dedicated team.",
    volunteerRegisterTitle: 'Volunteer Registration Form',
    itemRequestTitle: 'List of Items Needed',


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
    personnelName: 'Nama penuh',
    personnelContact: 'Contact',
    personnelIc: 'Nombor Ic',
    personnelAdress: 'Alamat',
    personnelEmail: 'E-mel',
    personnelPassword: 'Kata laluan',

    //Error Handling
    errorTitle: 'Ralat',
    generalErrorMsg: 'Ralat berlaku. Sila cuba lagi.',
    credentialErrorMsg: 'Bukti kelayakan tidak sah. Sila cuba lagi.',
    authenticationErrorMsg: 'Pengesahan gagal. Sila cuba sebentar lagi.',
    ok: 'Baik',

    //General things
    logOutTitle: 'Log Keluar',
    logOutMsg: 'Anda pasti ingin log keluar?',
    logout: 'Log Keluar',
    cancel: 'Batal',
    pleaseHintText: 'Sila tulis di sini',
    save: 'Simpan',
    submit: 'Hantar',
    insert: 'Daftarkan',

    //Homepage
    charity2024Title: 'Program Amal 2024',
    charity2024Subtitle: 'Koleksi aktviti daripada organizer',
    myEventTitle: 'Event Saya',
    myEventSubtitle: 'Organizer boleh buat program amal di sini',

    //Event
    createEventTitle: 'Buat Event Baru',
    createEventSubtitle: 'Tekan untuk buat file baru',
    eventTitle: 'Tajuk Event',
    eventDescription: 'Deskripsi Event',
    photoPosting: 'Iklan Event',
    itemName: 'Nama barang',
    itemQuantity: 'Jumlah',
    itemUnit: 'Unit',
    itemDate: 'Tarikh',
    donationTarget: 'Target Duit',
    donationCurrent: 'Jumlah Terkumpul Sekarang',
    donationStartDate: 'Tarikh Mula',
    donationEndDate: 'Tarikh Akhir',
    donationBankAccount: 'Akaun Bank',
    uploadGalleryImage: 'Muat Turun Gambar Galeri',
    showGalleryImage: 'Galleri',
    spiralCareDisclaimer: 'Penafian Spiral Care: Hai, saya Muhammad Yusri Bin Yusoff, pemilik aplikasi Spiral Care. Bagi pihak penganjur acara, kami memohon sokongan anda. Yakinlah, semua organisasi yang didaftarkan dalam aplikasi kami menjalani pemeriksaan latar belakang yang menyeluruh dan kelulusan oleh pasukan khusus Spiral Care.',
    volunteerRegisterTitle: 'Pendaftaran Sukarelawan',
    itemRequestTitle: 'Senarai Barang Di Perlukan',

  };
}