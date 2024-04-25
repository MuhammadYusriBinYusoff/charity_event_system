
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
  static const String loginForgotPassword = "loginForgotPassword";
  static const String emailResetPasswordTitle = "emailResetPasswordTitle";
  static const String resetPassword = "resetPassword";
  static const String forgetPassword = "forgetPassword";
  static const String pleaseEnterEmail = "pleaseEnterEmail";

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
  static const String errorFieldNotFilled = 'errorFieldNotFilled';
  static const String successEmailMsg = 'successEmailMsg';
  static const String errorEmailMsg = 'errorEmailMsg:';

  //General things
  static const String logOutTitle = "logOutTitle";
  static const String logOutMsg = "logOutMsg";
  static const String cancel = "cancel";
  static const String logout = "logout";
  static const String save = "save";
  static const String submit = "submit";
  static const String insert = "insert";
  static const String delete = "delete";
  static const String action = "action";
  static const String done = "done";
  static const String skip = "skip";
  static const String home = "home";
  static const String langugae = "Change Language";

  //Homepage
  static const String charity2024Title = 'charity2024';
  static const String charity2024Subtitle = 'charity2024Subtitle';
  static const String myEventTitle = "myEventTitle";
  static const String myEventSubtitle = "myEventSubtitle";
  static const String pleaseHintText = "pleaseHintText";

  //Onboarding
  static const String onBoardingTitle1 = "onBoardingTitle1";
  static const String onBoardingTitle2 = "onBoardingTitle2";
  static const String onBoardingTitle3 = "onBoardingTitle3";
  static const String onBoardingSubtitle1 = "onBoardingSubtitle1";
  static const String onBoardingSubtitle2 = "onBoardingSubtitle2";
  static const String onBoardingSubtitle3 = "onBoardingSubtitle3";

  //Event
  static const String createEventTitle = 'createEventTitle';
  static const String createEventSubtitle = 'createEventSubtitle';
  static const String eventTitle = 'eventTitle';
  static const String eventDescription = 'eventDescription';
  static const String eventInfoTitle = 'eventInfoTitle';
  static const String eventInfoSub = 'eventInfoSub';
  static const String photoPosting ='photoPhosting';
  static const String itemName = 'itemName';
  static const String itemQuantity = 'itemQuantity';
  static const String itemUnit = 'itemUnit';
  static const String itemDate = 'itemDate';
  static const String itemTable = 'itemTable';
  static const String itemInfoTitle = 'itemInfoTitle';
  static const String itemInfoSub = 'itemInfoSub';
  static const String itemListBorder = 'itemListBorder';
  static const String donationTarget = 'donationTarget';
  static const String donationCurrent = 'donationCurrent';
  static const String donationStartDate = 'donationStartDate';
  static const String donationEndDate = 'donationEndDate';
  static const String donationBankAccount = 'donationBankAccount';
  static const String donationQrcode = 'donationQrcode';
  static const String donationInfoTitle = 'donationInfoTitle';
  static const String donationInfoSub = 'donationInfoSub';
  static const String uploadGalleryImage = 'uploadGalleryImage';
  static const String showGalleryImage = 'showGalleryImage';
  static const String galleryInfoTitle = 'galleryInfoTitle';
  static const String galleryInfoSub = 'gallerynfoSub';
  static const String deleteGalleryTitle = 'deleteGalleryTitle';
  static const String deleteGalleryImageQuestion = 'deleteGalleryImageQuestion';
  static const String spiralCareDisclaimer = 'spiralCareDisclaimer';
  static const String volunteerRegisterTitle = 'volunteerRegisterTitle';
  static const String volunteerOrganizerView = 'volunteerOrganizerView';
  static const String volunteerInfoTitle = 'volunteerInfoTitle';
  static const String volunteerInfoSub = 'volunteerInfoSub';
  static const String itemRequestTitle = 'itemRequestTitle';
  static const String feedbackFormTitle = 'feedbackFormTitlte';
  static const String feedbackQuestion1 = "feedbackQuestion1";
  static const String feedbackQuestion2 = "feedbackQuestion2";
  static const String feedbackQuestion3 = "feedbackQuestion3";
  static const String feedbackQuestion4 = "feedbackQuestion4";
  static const String feedbackQuestion5 = "feedbackQuestion5";
  static const String feedbackQuestionHint = "feedbackQuestionHint";
  static const String feedbackCheck = "feedbackCheck";
  static const String manageDesciption = "manageDesciption";
  static const String manageItem = "manageItem";
  static const String manageDonation = "manageDonation";
  static const String manageVolunteer = "manageVolunteer";
  static const String teamPlanning = "teamPlanning";
  static const String manageGallery = "manageGallery";
  static const String items = "items";
  static const String feedbackCollection = "feedbackCollection";
  static const String deleteTaskTitle = 'deleteTaskTitle';
  static const String deleteTaskQuestion = 'deleteTaskQuestion';
  static const String taskTitle = 'taskTitle';
  static const String taskDescription = 'taskDescription';
  

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
    loginForgotPassword: 'Forgot password?',
    emailResetPasswordTitle: 'Please enter a valid email address',
    resetPassword: 'Reset Password',
    forgetPassword: 'Forget Password',
    pleaseEnterEmail: 'Enter your email to reset password:',
    
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
    errorFieldNotFilled: 'Please fill in all required fields.',
    successEmailMsg: 'Password reset email sent successfully',
    errorEmailMsg: 'Error sending password reset email',

    //General things
    logOutTitle: 'Log Out',
    logOutMsg: 'Are you sure you want to log out?',
    logout: 'Log Out',
    cancel: 'Cancel',
    pleaseHintText: 'Please write here',
    save: 'Save',
    submit: 'Submit',
    insert: 'Insert',
    delete: 'Delete',
    action: 'Action',
    done: 'Done',
    skip: 'Skip',
    home: 'Home',
    langugae: 'Languages',

    //Homepage
    charity2024Title: 'Charity Event 2024',
    charity2024Subtitle: 'Collection of activity from organizer',
    myEventTitle: 'My Event',
    myEventSubtitle: 'Organizer can create their event here',

    //Onboarding
    onBoardingTitle1: 'Tech for Good: Levitating Society through Innovative Charity Initiatives',
    onBoardingSubtitle1: 'Empowering Change: Levitate with Technology for Charity',
    onBoardingTitle2: 'Transform Lives: Donate Today',
    onBoardingSubtitle2: 'Empower change and make a difference through your generosity – every donation counts',
    onBoardingTitle3: 'Join the Community: Empower, Connect, Inspire',
    onBoardingSubtitle3: 'Connect with a community dedicated to positive change and meaningful connections',

    //Event
    createEventTitle: 'Create new event',
    createEventSubtitle: 'Tap to add new file',
    eventTitle: 'Event Title',
    eventDescription: 'Event Description',
    eventInfoTitle: "Event's Information",
    eventInfoSub: 'Organizer can register their events details here. All the details will be appear on homepage',
    photoPosting: 'Event Banner',
    itemName: 'Item Name',
    itemQuantity: 'Quantity',
    itemUnit: 'Unit',
    itemDate: 'Date',
    itemTable: 'View Item List',
    itemInfoTitle: 'Item Information',
    itemInfoSub: 'Organizer can list out all item they need such as food,stationery,books etc.',
    itemListBorder: 'Want to Change Your Item List?',
    donationTarget: 'Target Money',
    donationCurrent: 'Current Collected',
    donationStartDate: 'Start Date',
    donationEndDate: 'End Date',
    donationBankAccount: 'Bank Account',
    donationInfoTitle: 'Donation Information',
    donationInfoSub: 'Organizer can state the amount of money they need and set the dateline. All information will be displayed on homepage',
    donationQrcode: 'Qr Code',
    uploadGalleryImage: 'Upload Gallery Image',
    showGalleryImage: 'Gallery',
    deleteGalleryTitle: 'Delete Image?',
    deleteGalleryImageQuestion: 'Are you sure you want to delete this image?',
    galleryInfoTitle: 'Gallery Information',
    galleryInfoSub: 'What organizer can do on this page \n1. Organizer can upload and view their image \n2. To delete image, organizer need to hold pressed the picture they want to delete',
    spiralCareDisclaimer: "Spiral Care Disclaimer: Hi, I'm Muhammad Yusri Bin Yusoff, owner of the Spiral Care application. On behalf of the event organizers, we're seeking your support. Rest assured, all organizations registered in our app undergo thorough background checks and approval by Spiral Care dedicated team.",
    volunteerRegisterTitle: 'Volunteer Registration Form',
    volunteerOrganizerView: 'Volunteer Checklist',
    volunteerInfoTitle: 'Volunteer Name',
    volunteerInfoSub: 'Organizer can view the volunteer who interest to contribute to your event. You can remove any volunteer that want to cancel their registration here too!',
    itemRequestTitle: 'List of Items Needed',
    feedbackFormTitle: 'Feedback Form',
    feedbackQuestion1: 'Is the organizer a responsible person?',
    feedbackQuestion2: 'Does the organizer often upload event photos?',
    feedbackQuestion3: 'Is all the information provided by the organizer true and not misleading',
    feedbackQuestion4: 'How much do you recommend this organizer to the public?',
    feedbackQuestion5: 'Your Comment?',
    feedbackQuestionHint: 'Rating: 1-5 (Very Bad - Very Good)',
    feedbackCheck: 'Please give your rating',
    manageDesciption: 'My Event',
    manageDonation: 'Donation',
    manageGallery: 'Gallery',
    items: 'Items',
    feedbackCollection: 'Feedback',
    teamPlanning: 'Collaboration',
    manageVolunteer: 'Volunteer',
    manageItem: 'Item List',
    deleteTaskTitle: 'Confirm Deletion',
    deleteTaskQuestion: 'Are you sure you want to delete this task',
    taskTitle: 'Title of task',
    taskDescription: 'Description of task',

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
    loginForgotPassword: 'Lupa kata laluan?',
    emailResetPasswordTitle: 'Sila masukkan e-mel yang sah',
    resetPassword: 'Tetapkan Semula Kata Laluan',
    forgetPassword: 'Lupa Kata Laluan',
    pleaseEnterEmail: 'Masukkan Emel anda untuk tetapan semula kata laluan:',

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
    errorFieldNotFilled: 'Sila isi ruangan merah yang disediakan',
    successEmailMsg: 'E-mel tetapan semula kata laluan berjaya dihantar',
    errorEmailMsg: 'Ralat menghantar e-mel tetapan semula kata laluan',

    //General things
    logOutTitle: 'Log Keluar',
    logOutMsg: 'Anda pasti ingin log keluar?',
    logout: 'Log Keluar',
    cancel: 'Batal',
    pleaseHintText: 'Sila tulis di sini',
    save: 'Simpan',
    submit: 'Hantar',
    insert: 'Daftarkan',
    delete: 'Padam',
    action: 'Tindakan',
    done: 'Selesai',
    skip: 'Skip',
    home: 'Muka Depan',
    langugae: 'Tukar Bahasa',

    //Homepage
    charity2024Title: 'Program Amal 2024',
    charity2024Subtitle: 'Koleksi aktviti daripada organizer',
    myEventTitle: 'Event Saya',
    myEventSubtitle: 'Organizer boleh buat program amal di sini',

    //OnBoarding
    onBoardingTitle1: 'Teknologi untuk Kebaikan: Memanfaatkan Masyarakat melalui Inisiatif Amal Inovatif',
    onBoardingSubtitle1: 'Memperkasakan Perubahan: Memanfaatkan Teknologi untuk Amal',
    onBoardingTitle2: 'Perubahan Hidup: Derma Hari Ini',
    onBoardingSubtitle2: 'Perkasakan perubahan dan buat perubahan melalui kemurahan hati anda - setiap derma adalah penting',
    onBoardingTitle3: 'Sertai Komuniti: Perkasa, Sambung, Inspirasi',
    onBoardingSubtitle3: 'Berhubung dengan komuniti yang berdedikasi untuk perubahan positif dan hubungan bermakna',

    //Event
    createEventTitle: 'Buat Event Baru',
    createEventSubtitle: 'Tekan untuk buat file baru',
    eventTitle: 'Tajuk Event',
    eventDescription: 'Deskripsi Event',
    eventInfoTitle: "Informasi Event",
    eventInfoSub: 'Organizer boleh mendaftarkan butiran acara mereka di sini. Semua butiran akan dipaparkan di laman utama',
    photoPosting: 'Iklan Event',
    itemName: 'Nama barang',
    itemQuantity: 'Jumlah',
    itemUnit: 'Unit',
    itemDate: 'Tarikh',
    itemTable: 'Lihat Senarai Barang',
    itemInfoTitle: 'Informasi Barang',
    itemInfoSub: 'Organizer boleh menyenaraikan segala barang yang diperlukan seperti makanan,alat tulis, buku and lain-lain lagi.',
    itemListBorder: 'Ingin Ubah Senarai Barang Anda?',
    donationTarget: 'Target Duit',
    donationCurrent: 'Jumlah Terkumpul Sekarang',
    donationStartDate: 'Tarikh Mula',
    donationEndDate: 'Tarikh Akhir',
    donationBankAccount: 'Akaun Bank',
    donationInfoTitle: 'Informasi Donasi',
    donationInfoSub: 'Organizer boleh menyatakan jumlah wang yang mereka perlukan dan menetapkan garis tarikh. Semua maklumat akan dipaparkan di laman utama',
    donationQrcode: 'Kod Qr',
    uploadGalleryImage: 'Muat Turun Gambar Galeri',
    showGalleryImage: 'Galleri',
    deleteGalleryTitle: 'Padam, Gambar',
    deleteGalleryImageQuestion: 'Adakah awak yakin untuk padam gambar ini',
    galleryInfoTitle: 'Informasi Galleri',
    galleryInfoSub: 'Perkara yang boleh dilakukan oleh organizer di halaman ini \n1. Organizer boleh memuat naik dan melihat imej mereka \n2. Untuk memadamkan imej, organizer perlu menahan tekan gambar yang ingin dipadamkan',
    spiralCareDisclaimer: 'Penafian Spiral Care: Hai, saya Muhammad Yusri Bin Yusoff, pemilik aplikasi Spiral Care. Bagi pihak penganjur acara, kami memohon sokongan anda. Yakinlah, semua organisasi yang didaftarkan dalam aplikasi kami menjalani pemeriksaan latar belakang yang menyeluruh dan kelulusan oleh pasukan khusus Spiral Care.',
    volunteerRegisterTitle: 'Pendaftaran Sukarelawan',
    volunteerOrganizerView: 'Senarai Sukarelawan',
    volunteerInfoTitle: 'Nama Sukarelawan',
    volunteerInfoSub: 'Organizer boleh melihat sukarelawan yang berminat untuk menyumbang kepada acara anda. Anda boleh mengalih keluar mana-mana sukarelawan yang ingin membatalkan pendaftaran mereka di sini juga!',
    itemRequestTitle: 'Senarai Barang Di Perlukan',
    feedbackFormTitle: 'Borang Maklum Balas',
    feedbackQuestion1: 'Adakah organizer seorang yang bertanggungjawab?',
    feedbackQuestion2: 'Adakah organizer kerap memuat naik gambar event?',
    feedbackQuestion3: 'Adakah segala maklumat yang diberikan oleh organizer adalah benar dan tidak mengelirukan',
    feedbackQuestion4: 'Berapa anda syorkan organizer ini kepada umum?',
    feedbackQuestion5: 'Komen Anda?',
    feedbackQuestionHint: 'Penilaian: 1-5 (Sangat Buruk - Sangat Baik)',
    feedbackCheck: 'Sila berikan penilaian anda',
    manageDesciption: 'Event Saya',
    manageDonation: 'Sumbangan',
    manageGallery: 'Galeri',
    items: 'Barang',
    feedbackCollection: 'Maklum Balas',
    teamPlanning: 'Kolaborasi',
    manageVolunteer: 'Sukarelawan',
    manageItem: 'Senarai Barang',
    deleteTaskTitle: 'Sahkan Pemadaman',
    deleteTaskQuestion: 'Adakah awak pasti untuk padam tugasan ini',
    taskTitle: 'Tajuk tugasan',
    taskDescription: 'Ulasan tugasan',

  };
}