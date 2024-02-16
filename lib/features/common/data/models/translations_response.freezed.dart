// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translations_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TranslationsResponse _$TranslationsResponseFromJson(Map<String, dynamic> json) {
  return _TranslationsResponse.fromJson(json);
}

/// @nodoc
mixin _$TranslationsResponse {
  Account? get account => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TranslationsResponseCopyWith<TranslationsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationsResponseCopyWith<$Res> {
  factory $TranslationsResponseCopyWith(TranslationsResponse value,
          $Res Function(TranslationsResponse) then) =
      _$TranslationsResponseCopyWithImpl<$Res, TranslationsResponse>;
  @useResult
  $Res call({Account? account});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$TranslationsResponseCopyWithImpl<$Res,
        $Val extends TranslationsResponse>
    implements $TranslationsResponseCopyWith<$Res> {
  _$TranslationsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TranslationsResponseImplCopyWith<$Res>
    implements $TranslationsResponseCopyWith<$Res> {
  factory _$$TranslationsResponseImplCopyWith(_$TranslationsResponseImpl value,
          $Res Function(_$TranslationsResponseImpl) then) =
      __$$TranslationsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Account? account});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$$TranslationsResponseImplCopyWithImpl<$Res>
    extends _$TranslationsResponseCopyWithImpl<$Res, _$TranslationsResponseImpl>
    implements _$$TranslationsResponseImplCopyWith<$Res> {
  __$$TranslationsResponseImplCopyWithImpl(_$TranslationsResponseImpl _value,
      $Res Function(_$TranslationsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$TranslationsResponseImpl(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationsResponseImpl implements _TranslationsResponse {
  const _$TranslationsResponseImpl({this.account});

  factory _$TranslationsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationsResponseImplFromJson(json);

  @override
  final Account? account;

  @override
  String toString() {
    return 'TranslationsResponse(account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationsResponseImpl &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationsResponseImplCopyWith<_$TranslationsResponseImpl>
      get copyWith =>
          __$$TranslationsResponseImplCopyWithImpl<_$TranslationsResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationsResponseImplToJson(
      this,
    );
  }
}

abstract class _TranslationsResponse implements TranslationsResponse {
  const factory _TranslationsResponse({final Account? account}) =
      _$TranslationsResponseImpl;

  factory _TranslationsResponse.fromJson(Map<String, dynamic> json) =
      _$TranslationsResponseImpl.fromJson;

  @override
  Account? get account;
  @override
  @JsonKey(ignore: true)
  _$$TranslationsResponseImplCopyWith<_$TranslationsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String? get profileEmail => throw _privateConstructorUsedError;
  String? get changePhoneError => throw _privateConstructorUsedError;
  String? get deleteAccount => throw _privateConstructorUsedError;
  String? get deletingAccount => throw _privateConstructorUsedError;
  String? get profileGenderPlacehold => throw _privateConstructorUsedError;
  String? get tryAgainOtp => throw _privateConstructorUsedError;
  String? get oneMoreStep => throw _privateConstructorUsedError;
  String? get follow => throw _privateConstructorUsedError;
  String? get adFreeBrowsing => throw _privateConstructorUsedError;
  String? get digitalIslamicLifestyleEcosystem =>
      throw _privateConstructorUsedError;
  String? get prayerSettings => throw _privateConstructorUsedError;
  String? get adFreeBrowsingDesc => throw _privateConstructorUsedError;
  String? get passwordDescription => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;
  String? get justInfoAboutYou => throw _privateConstructorUsedError;
  String? get enterYourPassword => throw _privateConstructorUsedError;
  String? get iAgree => throw _privateConstructorUsedError;
  String? get changeAvatarError => throw _privateConstructorUsedError;
  String? get continueText => throw _privateConstructorUsedError;
  String? get profilePhoto => throw _privateConstructorUsedError;
  String? get profileEmailPlacehold => throw _privateConstructorUsedError;
  String? get profileBirthdayPlacehold => throw _privateConstructorUsedError;
  String? get authorizeThisAccount => throw _privateConstructorUsedError;
  String? get bigPoints => throw _privateConstructorUsedError;
  String? get livePrayerNotificationDesc => throw _privateConstructorUsedError;
  String? get beenWithUs => throw _privateConstructorUsedError;
  String? get settings => throw _privateConstructorUsedError;
  String? get changeEmailTitle => throw _privateConstructorUsedError;
  String? get profileGender => throw _privateConstructorUsedError;
  String? get ikhlasDigitalSadaqahDesc => throw _privateConstructorUsedError;
  String? get givenName => throw _privateConstructorUsedError;
  String? get requestAnotherEmail => throw _privateConstructorUsedError;
  String? get notLoggedIn => throw _privateConstructorUsedError;
  String? get myProfileTitle => throw _privateConstructorUsedError;
  String? get loginOrRegister => throw _privateConstructorUsedError;
  String? get cantDelete => throw _privateConstructorUsedError;
  String? get otpMessage => throw _privateConstructorUsedError;
  String? get requestNewOtp => throw _privateConstructorUsedError;
  String? get recomendedAvatar => throw _privateConstructorUsedError;
  String? get digitalIslamicLifestyleEcosystemDesc =>
      throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get bigMemberID => throw _privateConstructorUsedError;
  String? get debugPage => throw _privateConstructorUsedError;
  String? get sentInvitation => throw _privateConstructorUsedError;
  String? get didntGetOtp => throw _privateConstructorUsedError;
  String? get accountDeletionWrongEmail => throw _privateConstructorUsedError;
  String? get limitedOtp => throw _privateConstructorUsedError;
  String? get accountWillBeDeletedOn => throw _privateConstructorUsedError;
  String? get dialingCode => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get newPhonePlacehold => throw _privateConstructorUsedError;
  String? get livePrayerNotification => throw _privateConstructorUsedError;
  String? get setPasswordSub => throw _privateConstructorUsedError;
  String? get profileSkip => throw _privateConstructorUsedError;
  String? get checkProfileDialogSignOutBtn =>
      throw _privateConstructorUsedError;
  String? get ensure => throw _privateConstructorUsedError;
  String? get emptyFieldMessage => throw _privateConstructorUsedError;
  String? get logout => throw _privateConstructorUsedError;
  String? get confirmLogout => throw _privateConstructorUsedError;
  String? get or => throw _privateConstructorUsedError;
  String? get noSetting => throw _privateConstructorUsedError;
  String? get aboutToDeleteAccountPassword =>
      throw _privateConstructorUsedError;
  String? get invalidOtp => throw _privateConstructorUsedError;
  String? get invalidEmailMessage => throw _privateConstructorUsedError;
  String? get selectBirthday => throw _privateConstructorUsedError;
  String? get checkProfileDialogTitle => throw _privateConstructorUsedError;
  String? get profileFullName => throw _privateConstructorUsedError;
  String? get female => throw _privateConstructorUsedError;
  String? get cancel => throw _privateConstructorUsedError;
  String? get accountDeletionInProcess => throw _privateConstructorUsedError;
  String? get umhraTravelServices => throw _privateConstructorUsedError;
  String? get logoutErrorTip => throw _privateConstructorUsedError;
  String? get accountDetails => throw _privateConstructorUsedError;
  String? get profileBirthday => throw _privateConstructorUsedError;
  String? get resetTipContent => throw _privateConstructorUsedError;
  String? get wantToDelete => throw _privateConstructorUsedError;
  String? get umhraTravelServicesDesc => throw _privateConstructorUsedError;
  String? get changePhoneCountry => throw _privateConstructorUsedError;
  String? get oldPassword => throw _privateConstructorUsedError;
  String? get hasSetting => throw _privateConstructorUsedError;
  String? get popularCountries => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get dateErrorMessage => throw _privateConstructorUsedError;
  String? get invalidDialingCode => throw _privateConstructorUsedError;
  String? get newPassword => throw _privateConstructorUsedError;
  String? get invalidPhoneMessage => throw _privateConstructorUsedError;
  String? get verification => throw _privateConstructorUsedError;
  String? get checkProfileDialogMessage => throw _privateConstructorUsedError;
  String? get male => throw _privateConstructorUsedError;
  String? get sadToLetGo => throw _privateConstructorUsedError;
  String? get verificationLimitReached => throw _privateConstructorUsedError;
  String? get changePhoneTitle => throw _privateConstructorUsedError;
  String? get maximumOtp => throw _privateConstructorUsedError;
  String? get finishCredits => throw _privateConstructorUsedError;
  String? get setPasswordTitle => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get inSeconds => throw _privateConstructorUsedError;
  String? get activateYourAccount => throw _privateConstructorUsedError;
  String? get resendEmail => throw _privateConstructorUsedError;
  String? get changePhoneSub => throw _privateConstructorUsedError;
  String? get emailPlacehold => throw _privateConstructorUsedError;
  String? get verifyYourMobileNumber => throw _privateConstructorUsedError;
  String? get fullNameSetting => throw _privateConstructorUsedError;
  String? get aboutToDeleteAccountSocialMedia =>
      throw _privateConstructorUsedError;
  String? get familyName => throw _privateConstructorUsedError;
  String? get accountSecurityTitle => throw _privateConstructorUsedError;
  String? get updateProfileSuccessMessage => throw _privateConstructorUsedError;
  String? get aboutToDelete => throw _privateConstructorUsedError;
  String? get changePhoneCurrent => throw _privateConstructorUsedError;
  String? get ikhlasDigitalSadaqah => throw _privateConstructorUsedError;
  String? get requestAnotherEmailTimer => throw _privateConstructorUsedError;
  String? get profileFullNamePlacehold => throw _privateConstructorUsedError;
  String? get nameErrorMessage => throw _privateConstructorUsedError;
  String? get signUp => throw _privateConstructorUsedError;
  String? get updatePhoneNumber => throw _privateConstructorUsedError;
  String? get personalInformation => throw _privateConstructorUsedError;
  String? get profileTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String? profileEmail,
      String? changePhoneError,
      String? deleteAccount,
      String? deletingAccount,
      String? profileGenderPlacehold,
      String? tryAgainOtp,
      String? oneMoreStep,
      String? follow,
      String? adFreeBrowsing,
      String? digitalIslamicLifestyleEcosystem,
      String? prayerSettings,
      String? adFreeBrowsingDesc,
      String? passwordDescription,
      String? appVersion,
      String? justInfoAboutYou,
      String? enterYourPassword,
      String? iAgree,
      String? changeAvatarError,
      String? continueText,
      String? profilePhoto,
      String? profileEmailPlacehold,
      String? profileBirthdayPlacehold,
      String? authorizeThisAccount,
      String? bigPoints,
      String? livePrayerNotificationDesc,
      String? beenWithUs,
      String? settings,
      String? changeEmailTitle,
      String? profileGender,
      String? ikhlasDigitalSadaqahDesc,
      String? givenName,
      String? requestAnotherEmail,
      String? notLoggedIn,
      String? myProfileTitle,
      String? loginOrRegister,
      String? cantDelete,
      String? otpMessage,
      String? requestNewOtp,
      String? recomendedAvatar,
      String? digitalIslamicLifestyleEcosystemDesc,
      String? dateOfBirth,
      String? bigMemberID,
      String? debugPage,
      String? sentInvitation,
      String? didntGetOtp,
      String? accountDeletionWrongEmail,
      String? limitedOtp,
      String? accountWillBeDeletedOn,
      String? dialingCode,
      String? mobileNumber,
      String? search,
      String? newPhonePlacehold,
      String? livePrayerNotification,
      String? setPasswordSub,
      String? profileSkip,
      String? checkProfileDialogSignOutBtn,
      String? ensure,
      String? emptyFieldMessage,
      String? logout,
      String? confirmLogout,
      String? or,
      String? noSetting,
      String? aboutToDeleteAccountPassword,
      String? invalidOtp,
      String? invalidEmailMessage,
      String? selectBirthday,
      String? checkProfileDialogTitle,
      String? profileFullName,
      String? female,
      String? cancel,
      String? accountDeletionInProcess,
      String? umhraTravelServices,
      String? logoutErrorTip,
      String? accountDetails,
      String? profileBirthday,
      String? resetTipContent,
      String? wantToDelete,
      String? umhraTravelServicesDesc,
      String? changePhoneCountry,
      String? oldPassword,
      String? hasSetting,
      String? popularCountries,
      String? account,
      String? dateErrorMessage,
      String? invalidDialingCode,
      String? newPassword,
      String? invalidPhoneMessage,
      String? verification,
      String? checkProfileDialogMessage,
      String? male,
      String? sadToLetGo,
      String? verificationLimitReached,
      String? changePhoneTitle,
      String? maximumOtp,
      String? finishCredits,
      String? setPasswordTitle,
      String? confirmPassword,
      String? inSeconds,
      String? activateYourAccount,
      String? resendEmail,
      String? changePhoneSub,
      String? emailPlacehold,
      String? verifyYourMobileNumber,
      String? fullNameSetting,
      String? aboutToDeleteAccountSocialMedia,
      String? familyName,
      String? accountSecurityTitle,
      String? updateProfileSuccessMessage,
      String? aboutToDelete,
      String? changePhoneCurrent,
      String? ikhlasDigitalSadaqah,
      String? requestAnotherEmailTimer,
      String? profileFullNamePlacehold,
      String? nameErrorMessage,
      String? signUp,
      String? updatePhoneNumber,
      String? personalInformation,
      String? profileTitle});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileEmail = freezed,
    Object? changePhoneError = freezed,
    Object? deleteAccount = freezed,
    Object? deletingAccount = freezed,
    Object? profileGenderPlacehold = freezed,
    Object? tryAgainOtp = freezed,
    Object? oneMoreStep = freezed,
    Object? follow = freezed,
    Object? adFreeBrowsing = freezed,
    Object? digitalIslamicLifestyleEcosystem = freezed,
    Object? prayerSettings = freezed,
    Object? adFreeBrowsingDesc = freezed,
    Object? passwordDescription = freezed,
    Object? appVersion = freezed,
    Object? justInfoAboutYou = freezed,
    Object? enterYourPassword = freezed,
    Object? iAgree = freezed,
    Object? changeAvatarError = freezed,
    Object? continueText = freezed,
    Object? profilePhoto = freezed,
    Object? profileEmailPlacehold = freezed,
    Object? profileBirthdayPlacehold = freezed,
    Object? authorizeThisAccount = freezed,
    Object? bigPoints = freezed,
    Object? livePrayerNotificationDesc = freezed,
    Object? beenWithUs = freezed,
    Object? settings = freezed,
    Object? changeEmailTitle = freezed,
    Object? profileGender = freezed,
    Object? ikhlasDigitalSadaqahDesc = freezed,
    Object? givenName = freezed,
    Object? requestAnotherEmail = freezed,
    Object? notLoggedIn = freezed,
    Object? myProfileTitle = freezed,
    Object? loginOrRegister = freezed,
    Object? cantDelete = freezed,
    Object? otpMessage = freezed,
    Object? requestNewOtp = freezed,
    Object? recomendedAvatar = freezed,
    Object? digitalIslamicLifestyleEcosystemDesc = freezed,
    Object? dateOfBirth = freezed,
    Object? bigMemberID = freezed,
    Object? debugPage = freezed,
    Object? sentInvitation = freezed,
    Object? didntGetOtp = freezed,
    Object? accountDeletionWrongEmail = freezed,
    Object? limitedOtp = freezed,
    Object? accountWillBeDeletedOn = freezed,
    Object? dialingCode = freezed,
    Object? mobileNumber = freezed,
    Object? search = freezed,
    Object? newPhonePlacehold = freezed,
    Object? livePrayerNotification = freezed,
    Object? setPasswordSub = freezed,
    Object? profileSkip = freezed,
    Object? checkProfileDialogSignOutBtn = freezed,
    Object? ensure = freezed,
    Object? emptyFieldMessage = freezed,
    Object? logout = freezed,
    Object? confirmLogout = freezed,
    Object? or = freezed,
    Object? noSetting = freezed,
    Object? aboutToDeleteAccountPassword = freezed,
    Object? invalidOtp = freezed,
    Object? invalidEmailMessage = freezed,
    Object? selectBirthday = freezed,
    Object? checkProfileDialogTitle = freezed,
    Object? profileFullName = freezed,
    Object? female = freezed,
    Object? cancel = freezed,
    Object? accountDeletionInProcess = freezed,
    Object? umhraTravelServices = freezed,
    Object? logoutErrorTip = freezed,
    Object? accountDetails = freezed,
    Object? profileBirthday = freezed,
    Object? resetTipContent = freezed,
    Object? wantToDelete = freezed,
    Object? umhraTravelServicesDesc = freezed,
    Object? changePhoneCountry = freezed,
    Object? oldPassword = freezed,
    Object? hasSetting = freezed,
    Object? popularCountries = freezed,
    Object? account = freezed,
    Object? dateErrorMessage = freezed,
    Object? invalidDialingCode = freezed,
    Object? newPassword = freezed,
    Object? invalidPhoneMessage = freezed,
    Object? verification = freezed,
    Object? checkProfileDialogMessage = freezed,
    Object? male = freezed,
    Object? sadToLetGo = freezed,
    Object? verificationLimitReached = freezed,
    Object? changePhoneTitle = freezed,
    Object? maximumOtp = freezed,
    Object? finishCredits = freezed,
    Object? setPasswordTitle = freezed,
    Object? confirmPassword = freezed,
    Object? inSeconds = freezed,
    Object? activateYourAccount = freezed,
    Object? resendEmail = freezed,
    Object? changePhoneSub = freezed,
    Object? emailPlacehold = freezed,
    Object? verifyYourMobileNumber = freezed,
    Object? fullNameSetting = freezed,
    Object? aboutToDeleteAccountSocialMedia = freezed,
    Object? familyName = freezed,
    Object? accountSecurityTitle = freezed,
    Object? updateProfileSuccessMessage = freezed,
    Object? aboutToDelete = freezed,
    Object? changePhoneCurrent = freezed,
    Object? ikhlasDigitalSadaqah = freezed,
    Object? requestAnotherEmailTimer = freezed,
    Object? profileFullNamePlacehold = freezed,
    Object? nameErrorMessage = freezed,
    Object? signUp = freezed,
    Object? updatePhoneNumber = freezed,
    Object? personalInformation = freezed,
    Object? profileTitle = freezed,
  }) {
    return _then(_value.copyWith(
      profileEmail: freezed == profileEmail
          ? _value.profileEmail
          : profileEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneError: freezed == changePhoneError
          ? _value.changePhoneError
          : changePhoneError // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteAccount: freezed == deleteAccount
          ? _value.deleteAccount
          : deleteAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingAccount: freezed == deletingAccount
          ? _value.deletingAccount
          : deletingAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      profileGenderPlacehold: freezed == profileGenderPlacehold
          ? _value.profileGenderPlacehold
          : profileGenderPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      tryAgainOtp: freezed == tryAgainOtp
          ? _value.tryAgainOtp
          : tryAgainOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMoreStep: freezed == oneMoreStep
          ? _value.oneMoreStep
          : oneMoreStep // ignore: cast_nullable_to_non_nullable
              as String?,
      follow: freezed == follow
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as String?,
      adFreeBrowsing: freezed == adFreeBrowsing
          ? _value.adFreeBrowsing
          : adFreeBrowsing // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalIslamicLifestyleEcosystem: freezed ==
              digitalIslamicLifestyleEcosystem
          ? _value.digitalIslamicLifestyleEcosystem
          : digitalIslamicLifestyleEcosystem // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerSettings: freezed == prayerSettings
          ? _value.prayerSettings
          : prayerSettings // ignore: cast_nullable_to_non_nullable
              as String?,
      adFreeBrowsingDesc: freezed == adFreeBrowsingDesc
          ? _value.adFreeBrowsingDesc
          : adFreeBrowsingDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordDescription: freezed == passwordDescription
          ? _value.passwordDescription
          : passwordDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      justInfoAboutYou: freezed == justInfoAboutYou
          ? _value.justInfoAboutYou
          : justInfoAboutYou // ignore: cast_nullable_to_non_nullable
              as String?,
      enterYourPassword: freezed == enterYourPassword
          ? _value.enterYourPassword
          : enterYourPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      iAgree: freezed == iAgree
          ? _value.iAgree
          : iAgree // ignore: cast_nullable_to_non_nullable
              as String?,
      changeAvatarError: freezed == changeAvatarError
          ? _value.changeAvatarError
          : changeAvatarError // ignore: cast_nullable_to_non_nullable
              as String?,
      continueText: freezed == continueText
          ? _value.continueText
          : continueText // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      profileEmailPlacehold: freezed == profileEmailPlacehold
          ? _value.profileEmailPlacehold
          : profileEmailPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBirthdayPlacehold: freezed == profileBirthdayPlacehold
          ? _value.profileBirthdayPlacehold
          : profileBirthdayPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizeThisAccount: freezed == authorizeThisAccount
          ? _value.authorizeThisAccount
          : authorizeThisAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bigPoints: freezed == bigPoints
          ? _value.bigPoints
          : bigPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      livePrayerNotificationDesc: freezed == livePrayerNotificationDesc
          ? _value.livePrayerNotificationDesc
          : livePrayerNotificationDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      beenWithUs: freezed == beenWithUs
          ? _value.beenWithUs
          : beenWithUs // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as String?,
      changeEmailTitle: freezed == changeEmailTitle
          ? _value.changeEmailTitle
          : changeEmailTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      profileGender: freezed == profileGender
          ? _value.profileGender
          : profileGender // ignore: cast_nullable_to_non_nullable
              as String?,
      ikhlasDigitalSadaqahDesc: freezed == ikhlasDigitalSadaqahDesc
          ? _value.ikhlasDigitalSadaqahDesc
          : ikhlasDigitalSadaqahDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAnotherEmail: freezed == requestAnotherEmail
          ? _value.requestAnotherEmail
          : requestAnotherEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      notLoggedIn: freezed == notLoggedIn
          ? _value.notLoggedIn
          : notLoggedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      myProfileTitle: freezed == myProfileTitle
          ? _value.myProfileTitle
          : myProfileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      loginOrRegister: freezed == loginOrRegister
          ? _value.loginOrRegister
          : loginOrRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      cantDelete: freezed == cantDelete
          ? _value.cantDelete
          : cantDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      otpMessage: freezed == otpMessage
          ? _value.otpMessage
          : otpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNewOtp: freezed == requestNewOtp
          ? _value.requestNewOtp
          : requestNewOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      recomendedAvatar: freezed == recomendedAvatar
          ? _value.recomendedAvatar
          : recomendedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalIslamicLifestyleEcosystemDesc: freezed ==
              digitalIslamicLifestyleEcosystemDesc
          ? _value.digitalIslamicLifestyleEcosystemDesc
          : digitalIslamicLifestyleEcosystemDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      bigMemberID: freezed == bigMemberID
          ? _value.bigMemberID
          : bigMemberID // ignore: cast_nullable_to_non_nullable
              as String?,
      debugPage: freezed == debugPage
          ? _value.debugPage
          : debugPage // ignore: cast_nullable_to_non_nullable
              as String?,
      sentInvitation: freezed == sentInvitation
          ? _value.sentInvitation
          : sentInvitation // ignore: cast_nullable_to_non_nullable
              as String?,
      didntGetOtp: freezed == didntGetOtp
          ? _value.didntGetOtp
          : didntGetOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDeletionWrongEmail: freezed == accountDeletionWrongEmail
          ? _value.accountDeletionWrongEmail
          : accountDeletionWrongEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      limitedOtp: freezed == limitedOtp
          ? _value.limitedOtp
          : limitedOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      accountWillBeDeletedOn: freezed == accountWillBeDeletedOn
          ? _value.accountWillBeDeletedOn
          : accountWillBeDeletedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      dialingCode: freezed == dialingCode
          ? _value.dialingCode
          : dialingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      newPhonePlacehold: freezed == newPhonePlacehold
          ? _value.newPhonePlacehold
          : newPhonePlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      livePrayerNotification: freezed == livePrayerNotification
          ? _value.livePrayerNotification
          : livePrayerNotification // ignore: cast_nullable_to_non_nullable
              as String?,
      setPasswordSub: freezed == setPasswordSub
          ? _value.setPasswordSub
          : setPasswordSub // ignore: cast_nullable_to_non_nullable
              as String?,
      profileSkip: freezed == profileSkip
          ? _value.profileSkip
          : profileSkip // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogSignOutBtn: freezed == checkProfileDialogSignOutBtn
          ? _value.checkProfileDialogSignOutBtn
          : checkProfileDialogSignOutBtn // ignore: cast_nullable_to_non_nullable
              as String?,
      ensure: freezed == ensure
          ? _value.ensure
          : ensure // ignore: cast_nullable_to_non_nullable
              as String?,
      emptyFieldMessage: freezed == emptyFieldMessage
          ? _value.emptyFieldMessage
          : emptyFieldMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      logout: freezed == logout
          ? _value.logout
          : logout // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmLogout: freezed == confirmLogout
          ? _value.confirmLogout
          : confirmLogout // ignore: cast_nullable_to_non_nullable
              as String?,
      or: freezed == or
          ? _value.or
          : or // ignore: cast_nullable_to_non_nullable
              as String?,
      noSetting: freezed == noSetting
          ? _value.noSetting
          : noSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDeleteAccountPassword: freezed == aboutToDeleteAccountPassword
          ? _value.aboutToDeleteAccountPassword
          : aboutToDeleteAccountPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidOtp: freezed == invalidOtp
          ? _value.invalidOtp
          : invalidOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidEmailMessage: freezed == invalidEmailMessage
          ? _value.invalidEmailMessage
          : invalidEmailMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      selectBirthday: freezed == selectBirthday
          ? _value.selectBirthday
          : selectBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogTitle: freezed == checkProfileDialogTitle
          ? _value.checkProfileDialogTitle
          : checkProfileDialogTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFullName: freezed == profileFullName
          ? _value.profileFullName
          : profileFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      female: freezed == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as String?,
      cancel: freezed == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDeletionInProcess: freezed == accountDeletionInProcess
          ? _value.accountDeletionInProcess
          : accountDeletionInProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      umhraTravelServices: freezed == umhraTravelServices
          ? _value.umhraTravelServices
          : umhraTravelServices // ignore: cast_nullable_to_non_nullable
              as String?,
      logoutErrorTip: freezed == logoutErrorTip
          ? _value.logoutErrorTip
          : logoutErrorTip // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDetails: freezed == accountDetails
          ? _value.accountDetails
          : accountDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBirthday: freezed == profileBirthday
          ? _value.profileBirthday
          : profileBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      resetTipContent: freezed == resetTipContent
          ? _value.resetTipContent
          : resetTipContent // ignore: cast_nullable_to_non_nullable
              as String?,
      wantToDelete: freezed == wantToDelete
          ? _value.wantToDelete
          : wantToDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      umhraTravelServicesDesc: freezed == umhraTravelServicesDesc
          ? _value.umhraTravelServicesDesc
          : umhraTravelServicesDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneCountry: freezed == changePhoneCountry
          ? _value.changePhoneCountry
          : changePhoneCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPassword: freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSetting: freezed == hasSetting
          ? _value.hasSetting
          : hasSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      popularCountries: freezed == popularCountries
          ? _value.popularCountries
          : popularCountries // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      dateErrorMessage: freezed == dateErrorMessage
          ? _value.dateErrorMessage
          : dateErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidDialingCode: freezed == invalidDialingCode
          ? _value.invalidDialingCode
          : invalidDialingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidPhoneMessage: freezed == invalidPhoneMessage
          ? _value.invalidPhoneMessage
          : invalidPhoneMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogMessage: freezed == checkProfileDialogMessage
          ? _value.checkProfileDialogMessage
          : checkProfileDialogMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      male: freezed == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as String?,
      sadToLetGo: freezed == sadToLetGo
          ? _value.sadToLetGo
          : sadToLetGo // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLimitReached: freezed == verificationLimitReached
          ? _value.verificationLimitReached
          : verificationLimitReached // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneTitle: freezed == changePhoneTitle
          ? _value.changePhoneTitle
          : changePhoneTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      maximumOtp: freezed == maximumOtp
          ? _value.maximumOtp
          : maximumOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      finishCredits: freezed == finishCredits
          ? _value.finishCredits
          : finishCredits // ignore: cast_nullable_to_non_nullable
              as String?,
      setPasswordTitle: freezed == setPasswordTitle
          ? _value.setPasswordTitle
          : setPasswordTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      inSeconds: freezed == inSeconds
          ? _value.inSeconds
          : inSeconds // ignore: cast_nullable_to_non_nullable
              as String?,
      activateYourAccount: freezed == activateYourAccount
          ? _value.activateYourAccount
          : activateYourAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      resendEmail: freezed == resendEmail
          ? _value.resendEmail
          : resendEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneSub: freezed == changePhoneSub
          ? _value.changePhoneSub
          : changePhoneSub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailPlacehold: freezed == emailPlacehold
          ? _value.emailPlacehold
          : emailPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyYourMobileNumber: freezed == verifyYourMobileNumber
          ? _value.verifyYourMobileNumber
          : verifyYourMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameSetting: freezed == fullNameSetting
          ? _value.fullNameSetting
          : fullNameSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDeleteAccountSocialMedia: freezed ==
              aboutToDeleteAccountSocialMedia
          ? _value.aboutToDeleteAccountSocialMedia
          : aboutToDeleteAccountSocialMedia // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountSecurityTitle: freezed == accountSecurityTitle
          ? _value.accountSecurityTitle
          : accountSecurityTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      updateProfileSuccessMessage: freezed == updateProfileSuccessMessage
          ? _value.updateProfileSuccessMessage
          : updateProfileSuccessMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDelete: freezed == aboutToDelete
          ? _value.aboutToDelete
          : aboutToDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneCurrent: freezed == changePhoneCurrent
          ? _value.changePhoneCurrent
          : changePhoneCurrent // ignore: cast_nullable_to_non_nullable
              as String?,
      ikhlasDigitalSadaqah: freezed == ikhlasDigitalSadaqah
          ? _value.ikhlasDigitalSadaqah
          : ikhlasDigitalSadaqah // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAnotherEmailTimer: freezed == requestAnotherEmailTimer
          ? _value.requestAnotherEmailTimer
          : requestAnotherEmailTimer // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFullNamePlacehold: freezed == profileFullNamePlacehold
          ? _value.profileFullNamePlacehold
          : profileFullNamePlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      nameErrorMessage: freezed == nameErrorMessage
          ? _value.nameErrorMessage
          : nameErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      signUp: freezed == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as String?,
      updatePhoneNumber: freezed == updatePhoneNumber
          ? _value.updatePhoneNumber
          : updatePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      personalInformation: freezed == personalInformation
          ? _value.personalInformation
          : personalInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileTitle: freezed == profileTitle
          ? _value.profileTitle
          : profileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? profileEmail,
      String? changePhoneError,
      String? deleteAccount,
      String? deletingAccount,
      String? profileGenderPlacehold,
      String? tryAgainOtp,
      String? oneMoreStep,
      String? follow,
      String? adFreeBrowsing,
      String? digitalIslamicLifestyleEcosystem,
      String? prayerSettings,
      String? adFreeBrowsingDesc,
      String? passwordDescription,
      String? appVersion,
      String? justInfoAboutYou,
      String? enterYourPassword,
      String? iAgree,
      String? changeAvatarError,
      String? continueText,
      String? profilePhoto,
      String? profileEmailPlacehold,
      String? profileBirthdayPlacehold,
      String? authorizeThisAccount,
      String? bigPoints,
      String? livePrayerNotificationDesc,
      String? beenWithUs,
      String? settings,
      String? changeEmailTitle,
      String? profileGender,
      String? ikhlasDigitalSadaqahDesc,
      String? givenName,
      String? requestAnotherEmail,
      String? notLoggedIn,
      String? myProfileTitle,
      String? loginOrRegister,
      String? cantDelete,
      String? otpMessage,
      String? requestNewOtp,
      String? recomendedAvatar,
      String? digitalIslamicLifestyleEcosystemDesc,
      String? dateOfBirth,
      String? bigMemberID,
      String? debugPage,
      String? sentInvitation,
      String? didntGetOtp,
      String? accountDeletionWrongEmail,
      String? limitedOtp,
      String? accountWillBeDeletedOn,
      String? dialingCode,
      String? mobileNumber,
      String? search,
      String? newPhonePlacehold,
      String? livePrayerNotification,
      String? setPasswordSub,
      String? profileSkip,
      String? checkProfileDialogSignOutBtn,
      String? ensure,
      String? emptyFieldMessage,
      String? logout,
      String? confirmLogout,
      String? or,
      String? noSetting,
      String? aboutToDeleteAccountPassword,
      String? invalidOtp,
      String? invalidEmailMessage,
      String? selectBirthday,
      String? checkProfileDialogTitle,
      String? profileFullName,
      String? female,
      String? cancel,
      String? accountDeletionInProcess,
      String? umhraTravelServices,
      String? logoutErrorTip,
      String? accountDetails,
      String? profileBirthday,
      String? resetTipContent,
      String? wantToDelete,
      String? umhraTravelServicesDesc,
      String? changePhoneCountry,
      String? oldPassword,
      String? hasSetting,
      String? popularCountries,
      String? account,
      String? dateErrorMessage,
      String? invalidDialingCode,
      String? newPassword,
      String? invalidPhoneMessage,
      String? verification,
      String? checkProfileDialogMessage,
      String? male,
      String? sadToLetGo,
      String? verificationLimitReached,
      String? changePhoneTitle,
      String? maximumOtp,
      String? finishCredits,
      String? setPasswordTitle,
      String? confirmPassword,
      String? inSeconds,
      String? activateYourAccount,
      String? resendEmail,
      String? changePhoneSub,
      String? emailPlacehold,
      String? verifyYourMobileNumber,
      String? fullNameSetting,
      String? aboutToDeleteAccountSocialMedia,
      String? familyName,
      String? accountSecurityTitle,
      String? updateProfileSuccessMessage,
      String? aboutToDelete,
      String? changePhoneCurrent,
      String? ikhlasDigitalSadaqah,
      String? requestAnotherEmailTimer,
      String? profileFullNamePlacehold,
      String? nameErrorMessage,
      String? signUp,
      String? updatePhoneNumber,
      String? personalInformation,
      String? profileTitle});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileEmail = freezed,
    Object? changePhoneError = freezed,
    Object? deleteAccount = freezed,
    Object? deletingAccount = freezed,
    Object? profileGenderPlacehold = freezed,
    Object? tryAgainOtp = freezed,
    Object? oneMoreStep = freezed,
    Object? follow = freezed,
    Object? adFreeBrowsing = freezed,
    Object? digitalIslamicLifestyleEcosystem = freezed,
    Object? prayerSettings = freezed,
    Object? adFreeBrowsingDesc = freezed,
    Object? passwordDescription = freezed,
    Object? appVersion = freezed,
    Object? justInfoAboutYou = freezed,
    Object? enterYourPassword = freezed,
    Object? iAgree = freezed,
    Object? changeAvatarError = freezed,
    Object? continueText = freezed,
    Object? profilePhoto = freezed,
    Object? profileEmailPlacehold = freezed,
    Object? profileBirthdayPlacehold = freezed,
    Object? authorizeThisAccount = freezed,
    Object? bigPoints = freezed,
    Object? livePrayerNotificationDesc = freezed,
    Object? beenWithUs = freezed,
    Object? settings = freezed,
    Object? changeEmailTitle = freezed,
    Object? profileGender = freezed,
    Object? ikhlasDigitalSadaqahDesc = freezed,
    Object? givenName = freezed,
    Object? requestAnotherEmail = freezed,
    Object? notLoggedIn = freezed,
    Object? myProfileTitle = freezed,
    Object? loginOrRegister = freezed,
    Object? cantDelete = freezed,
    Object? otpMessage = freezed,
    Object? requestNewOtp = freezed,
    Object? recomendedAvatar = freezed,
    Object? digitalIslamicLifestyleEcosystemDesc = freezed,
    Object? dateOfBirth = freezed,
    Object? bigMemberID = freezed,
    Object? debugPage = freezed,
    Object? sentInvitation = freezed,
    Object? didntGetOtp = freezed,
    Object? accountDeletionWrongEmail = freezed,
    Object? limitedOtp = freezed,
    Object? accountWillBeDeletedOn = freezed,
    Object? dialingCode = freezed,
    Object? mobileNumber = freezed,
    Object? search = freezed,
    Object? newPhonePlacehold = freezed,
    Object? livePrayerNotification = freezed,
    Object? setPasswordSub = freezed,
    Object? profileSkip = freezed,
    Object? checkProfileDialogSignOutBtn = freezed,
    Object? ensure = freezed,
    Object? emptyFieldMessage = freezed,
    Object? logout = freezed,
    Object? confirmLogout = freezed,
    Object? or = freezed,
    Object? noSetting = freezed,
    Object? aboutToDeleteAccountPassword = freezed,
    Object? invalidOtp = freezed,
    Object? invalidEmailMessage = freezed,
    Object? selectBirthday = freezed,
    Object? checkProfileDialogTitle = freezed,
    Object? profileFullName = freezed,
    Object? female = freezed,
    Object? cancel = freezed,
    Object? accountDeletionInProcess = freezed,
    Object? umhraTravelServices = freezed,
    Object? logoutErrorTip = freezed,
    Object? accountDetails = freezed,
    Object? profileBirthday = freezed,
    Object? resetTipContent = freezed,
    Object? wantToDelete = freezed,
    Object? umhraTravelServicesDesc = freezed,
    Object? changePhoneCountry = freezed,
    Object? oldPassword = freezed,
    Object? hasSetting = freezed,
    Object? popularCountries = freezed,
    Object? account = freezed,
    Object? dateErrorMessage = freezed,
    Object? invalidDialingCode = freezed,
    Object? newPassword = freezed,
    Object? invalidPhoneMessage = freezed,
    Object? verification = freezed,
    Object? checkProfileDialogMessage = freezed,
    Object? male = freezed,
    Object? sadToLetGo = freezed,
    Object? verificationLimitReached = freezed,
    Object? changePhoneTitle = freezed,
    Object? maximumOtp = freezed,
    Object? finishCredits = freezed,
    Object? setPasswordTitle = freezed,
    Object? confirmPassword = freezed,
    Object? inSeconds = freezed,
    Object? activateYourAccount = freezed,
    Object? resendEmail = freezed,
    Object? changePhoneSub = freezed,
    Object? emailPlacehold = freezed,
    Object? verifyYourMobileNumber = freezed,
    Object? fullNameSetting = freezed,
    Object? aboutToDeleteAccountSocialMedia = freezed,
    Object? familyName = freezed,
    Object? accountSecurityTitle = freezed,
    Object? updateProfileSuccessMessage = freezed,
    Object? aboutToDelete = freezed,
    Object? changePhoneCurrent = freezed,
    Object? ikhlasDigitalSadaqah = freezed,
    Object? requestAnotherEmailTimer = freezed,
    Object? profileFullNamePlacehold = freezed,
    Object? nameErrorMessage = freezed,
    Object? signUp = freezed,
    Object? updatePhoneNumber = freezed,
    Object? personalInformation = freezed,
    Object? profileTitle = freezed,
  }) {
    return _then(_$AccountImpl(
      profileEmail: freezed == profileEmail
          ? _value.profileEmail
          : profileEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneError: freezed == changePhoneError
          ? _value.changePhoneError
          : changePhoneError // ignore: cast_nullable_to_non_nullable
              as String?,
      deleteAccount: freezed == deleteAccount
          ? _value.deleteAccount
          : deleteAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      deletingAccount: freezed == deletingAccount
          ? _value.deletingAccount
          : deletingAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      profileGenderPlacehold: freezed == profileGenderPlacehold
          ? _value.profileGenderPlacehold
          : profileGenderPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      tryAgainOtp: freezed == tryAgainOtp
          ? _value.tryAgainOtp
          : tryAgainOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      oneMoreStep: freezed == oneMoreStep
          ? _value.oneMoreStep
          : oneMoreStep // ignore: cast_nullable_to_non_nullable
              as String?,
      follow: freezed == follow
          ? _value.follow
          : follow // ignore: cast_nullable_to_non_nullable
              as String?,
      adFreeBrowsing: freezed == adFreeBrowsing
          ? _value.adFreeBrowsing
          : adFreeBrowsing // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalIslamicLifestyleEcosystem: freezed ==
              digitalIslamicLifestyleEcosystem
          ? _value.digitalIslamicLifestyleEcosystem
          : digitalIslamicLifestyleEcosystem // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerSettings: freezed == prayerSettings
          ? _value.prayerSettings
          : prayerSettings // ignore: cast_nullable_to_non_nullable
              as String?,
      adFreeBrowsingDesc: freezed == adFreeBrowsingDesc
          ? _value.adFreeBrowsingDesc
          : adFreeBrowsingDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordDescription: freezed == passwordDescription
          ? _value.passwordDescription
          : passwordDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      justInfoAboutYou: freezed == justInfoAboutYou
          ? _value.justInfoAboutYou
          : justInfoAboutYou // ignore: cast_nullable_to_non_nullable
              as String?,
      enterYourPassword: freezed == enterYourPassword
          ? _value.enterYourPassword
          : enterYourPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      iAgree: freezed == iAgree
          ? _value.iAgree
          : iAgree // ignore: cast_nullable_to_non_nullable
              as String?,
      changeAvatarError: freezed == changeAvatarError
          ? _value.changeAvatarError
          : changeAvatarError // ignore: cast_nullable_to_non_nullable
              as String?,
      continueText: freezed == continueText
          ? _value.continueText
          : continueText // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: freezed == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      profileEmailPlacehold: freezed == profileEmailPlacehold
          ? _value.profileEmailPlacehold
          : profileEmailPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBirthdayPlacehold: freezed == profileBirthdayPlacehold
          ? _value.profileBirthdayPlacehold
          : profileBirthdayPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      authorizeThisAccount: freezed == authorizeThisAccount
          ? _value.authorizeThisAccount
          : authorizeThisAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      bigPoints: freezed == bigPoints
          ? _value.bigPoints
          : bigPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      livePrayerNotificationDesc: freezed == livePrayerNotificationDesc
          ? _value.livePrayerNotificationDesc
          : livePrayerNotificationDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      beenWithUs: freezed == beenWithUs
          ? _value.beenWithUs
          : beenWithUs // ignore: cast_nullable_to_non_nullable
              as String?,
      settings: freezed == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as String?,
      changeEmailTitle: freezed == changeEmailTitle
          ? _value.changeEmailTitle
          : changeEmailTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      profileGender: freezed == profileGender
          ? _value.profileGender
          : profileGender // ignore: cast_nullable_to_non_nullable
              as String?,
      ikhlasDigitalSadaqahDesc: freezed == ikhlasDigitalSadaqahDesc
          ? _value.ikhlasDigitalSadaqahDesc
          : ikhlasDigitalSadaqahDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAnotherEmail: freezed == requestAnotherEmail
          ? _value.requestAnotherEmail
          : requestAnotherEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      notLoggedIn: freezed == notLoggedIn
          ? _value.notLoggedIn
          : notLoggedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      myProfileTitle: freezed == myProfileTitle
          ? _value.myProfileTitle
          : myProfileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      loginOrRegister: freezed == loginOrRegister
          ? _value.loginOrRegister
          : loginOrRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      cantDelete: freezed == cantDelete
          ? _value.cantDelete
          : cantDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      otpMessage: freezed == otpMessage
          ? _value.otpMessage
          : otpMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      requestNewOtp: freezed == requestNewOtp
          ? _value.requestNewOtp
          : requestNewOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      recomendedAvatar: freezed == recomendedAvatar
          ? _value.recomendedAvatar
          : recomendedAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      digitalIslamicLifestyleEcosystemDesc: freezed ==
              digitalIslamicLifestyleEcosystemDesc
          ? _value.digitalIslamicLifestyleEcosystemDesc
          : digitalIslamicLifestyleEcosystemDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      bigMemberID: freezed == bigMemberID
          ? _value.bigMemberID
          : bigMemberID // ignore: cast_nullable_to_non_nullable
              as String?,
      debugPage: freezed == debugPage
          ? _value.debugPage
          : debugPage // ignore: cast_nullable_to_non_nullable
              as String?,
      sentInvitation: freezed == sentInvitation
          ? _value.sentInvitation
          : sentInvitation // ignore: cast_nullable_to_non_nullable
              as String?,
      didntGetOtp: freezed == didntGetOtp
          ? _value.didntGetOtp
          : didntGetOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDeletionWrongEmail: freezed == accountDeletionWrongEmail
          ? _value.accountDeletionWrongEmail
          : accountDeletionWrongEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      limitedOtp: freezed == limitedOtp
          ? _value.limitedOtp
          : limitedOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      accountWillBeDeletedOn: freezed == accountWillBeDeletedOn
          ? _value.accountWillBeDeletedOn
          : accountWillBeDeletedOn // ignore: cast_nullable_to_non_nullable
              as String?,
      dialingCode: freezed == dialingCode
          ? _value.dialingCode
          : dialingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      newPhonePlacehold: freezed == newPhonePlacehold
          ? _value.newPhonePlacehold
          : newPhonePlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      livePrayerNotification: freezed == livePrayerNotification
          ? _value.livePrayerNotification
          : livePrayerNotification // ignore: cast_nullable_to_non_nullable
              as String?,
      setPasswordSub: freezed == setPasswordSub
          ? _value.setPasswordSub
          : setPasswordSub // ignore: cast_nullable_to_non_nullable
              as String?,
      profileSkip: freezed == profileSkip
          ? _value.profileSkip
          : profileSkip // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogSignOutBtn: freezed == checkProfileDialogSignOutBtn
          ? _value.checkProfileDialogSignOutBtn
          : checkProfileDialogSignOutBtn // ignore: cast_nullable_to_non_nullable
              as String?,
      ensure: freezed == ensure
          ? _value.ensure
          : ensure // ignore: cast_nullable_to_non_nullable
              as String?,
      emptyFieldMessage: freezed == emptyFieldMessage
          ? _value.emptyFieldMessage
          : emptyFieldMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      logout: freezed == logout
          ? _value.logout
          : logout // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmLogout: freezed == confirmLogout
          ? _value.confirmLogout
          : confirmLogout // ignore: cast_nullable_to_non_nullable
              as String?,
      or: freezed == or
          ? _value.or
          : or // ignore: cast_nullable_to_non_nullable
              as String?,
      noSetting: freezed == noSetting
          ? _value.noSetting
          : noSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDeleteAccountPassword: freezed == aboutToDeleteAccountPassword
          ? _value.aboutToDeleteAccountPassword
          : aboutToDeleteAccountPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidOtp: freezed == invalidOtp
          ? _value.invalidOtp
          : invalidOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidEmailMessage: freezed == invalidEmailMessage
          ? _value.invalidEmailMessage
          : invalidEmailMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      selectBirthday: freezed == selectBirthday
          ? _value.selectBirthday
          : selectBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogTitle: freezed == checkProfileDialogTitle
          ? _value.checkProfileDialogTitle
          : checkProfileDialogTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFullName: freezed == profileFullName
          ? _value.profileFullName
          : profileFullName // ignore: cast_nullable_to_non_nullable
              as String?,
      female: freezed == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as String?,
      cancel: freezed == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDeletionInProcess: freezed == accountDeletionInProcess
          ? _value.accountDeletionInProcess
          : accountDeletionInProcess // ignore: cast_nullable_to_non_nullable
              as String?,
      umhraTravelServices: freezed == umhraTravelServices
          ? _value.umhraTravelServices
          : umhraTravelServices // ignore: cast_nullable_to_non_nullable
              as String?,
      logoutErrorTip: freezed == logoutErrorTip
          ? _value.logoutErrorTip
          : logoutErrorTip // ignore: cast_nullable_to_non_nullable
              as String?,
      accountDetails: freezed == accountDetails
          ? _value.accountDetails
          : accountDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      profileBirthday: freezed == profileBirthday
          ? _value.profileBirthday
          : profileBirthday // ignore: cast_nullable_to_non_nullable
              as String?,
      resetTipContent: freezed == resetTipContent
          ? _value.resetTipContent
          : resetTipContent // ignore: cast_nullable_to_non_nullable
              as String?,
      wantToDelete: freezed == wantToDelete
          ? _value.wantToDelete
          : wantToDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      umhraTravelServicesDesc: freezed == umhraTravelServicesDesc
          ? _value.umhraTravelServicesDesc
          : umhraTravelServicesDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneCountry: freezed == changePhoneCountry
          ? _value.changePhoneCountry
          : changePhoneCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      oldPassword: freezed == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSetting: freezed == hasSetting
          ? _value.hasSetting
          : hasSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      popularCountries: freezed == popularCountries
          ? _value.popularCountries
          : popularCountries // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      dateErrorMessage: freezed == dateErrorMessage
          ? _value.dateErrorMessage
          : dateErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidDialingCode: freezed == invalidDialingCode
          ? _value.invalidDialingCode
          : invalidDialingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      newPassword: freezed == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      invalidPhoneMessage: freezed == invalidPhoneMessage
          ? _value.invalidPhoneMessage
          : invalidPhoneMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      verification: freezed == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as String?,
      checkProfileDialogMessage: freezed == checkProfileDialogMessage
          ? _value.checkProfileDialogMessage
          : checkProfileDialogMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      male: freezed == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as String?,
      sadToLetGo: freezed == sadToLetGo
          ? _value.sadToLetGo
          : sadToLetGo // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationLimitReached: freezed == verificationLimitReached
          ? _value.verificationLimitReached
          : verificationLimitReached // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneTitle: freezed == changePhoneTitle
          ? _value.changePhoneTitle
          : changePhoneTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      maximumOtp: freezed == maximumOtp
          ? _value.maximumOtp
          : maximumOtp // ignore: cast_nullable_to_non_nullable
              as String?,
      finishCredits: freezed == finishCredits
          ? _value.finishCredits
          : finishCredits // ignore: cast_nullable_to_non_nullable
              as String?,
      setPasswordTitle: freezed == setPasswordTitle
          ? _value.setPasswordTitle
          : setPasswordTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      inSeconds: freezed == inSeconds
          ? _value.inSeconds
          : inSeconds // ignore: cast_nullable_to_non_nullable
              as String?,
      activateYourAccount: freezed == activateYourAccount
          ? _value.activateYourAccount
          : activateYourAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      resendEmail: freezed == resendEmail
          ? _value.resendEmail
          : resendEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneSub: freezed == changePhoneSub
          ? _value.changePhoneSub
          : changePhoneSub // ignore: cast_nullable_to_non_nullable
              as String?,
      emailPlacehold: freezed == emailPlacehold
          ? _value.emailPlacehold
          : emailPlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      verifyYourMobileNumber: freezed == verifyYourMobileNumber
          ? _value.verifyYourMobileNumber
          : verifyYourMobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      fullNameSetting: freezed == fullNameSetting
          ? _value.fullNameSetting
          : fullNameSetting // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDeleteAccountSocialMedia: freezed ==
              aboutToDeleteAccountSocialMedia
          ? _value.aboutToDeleteAccountSocialMedia
          : aboutToDeleteAccountSocialMedia // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountSecurityTitle: freezed == accountSecurityTitle
          ? _value.accountSecurityTitle
          : accountSecurityTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      updateProfileSuccessMessage: freezed == updateProfileSuccessMessage
          ? _value.updateProfileSuccessMessage
          : updateProfileSuccessMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutToDelete: freezed == aboutToDelete
          ? _value.aboutToDelete
          : aboutToDelete // ignore: cast_nullable_to_non_nullable
              as String?,
      changePhoneCurrent: freezed == changePhoneCurrent
          ? _value.changePhoneCurrent
          : changePhoneCurrent // ignore: cast_nullable_to_non_nullable
              as String?,
      ikhlasDigitalSadaqah: freezed == ikhlasDigitalSadaqah
          ? _value.ikhlasDigitalSadaqah
          : ikhlasDigitalSadaqah // ignore: cast_nullable_to_non_nullable
              as String?,
      requestAnotherEmailTimer: freezed == requestAnotherEmailTimer
          ? _value.requestAnotherEmailTimer
          : requestAnotherEmailTimer // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFullNamePlacehold: freezed == profileFullNamePlacehold
          ? _value.profileFullNamePlacehold
          : profileFullNamePlacehold // ignore: cast_nullable_to_non_nullable
              as String?,
      nameErrorMessage: freezed == nameErrorMessage
          ? _value.nameErrorMessage
          : nameErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      signUp: freezed == signUp
          ? _value.signUp
          : signUp // ignore: cast_nullable_to_non_nullable
              as String?,
      updatePhoneNumber: freezed == updatePhoneNumber
          ? _value.updatePhoneNumber
          : updatePhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      personalInformation: freezed == personalInformation
          ? _value.personalInformation
          : personalInformation // ignore: cast_nullable_to_non_nullable
              as String?,
      profileTitle: freezed == profileTitle
          ? _value.profileTitle
          : profileTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl(
      {this.profileEmail,
      this.changePhoneError,
      this.deleteAccount,
      this.deletingAccount,
      this.profileGenderPlacehold,
      this.tryAgainOtp,
      this.oneMoreStep,
      this.follow,
      this.adFreeBrowsing,
      this.digitalIslamicLifestyleEcosystem,
      this.prayerSettings,
      this.adFreeBrowsingDesc,
      this.passwordDescription,
      this.appVersion,
      this.justInfoAboutYou,
      this.enterYourPassword,
      this.iAgree,
      this.changeAvatarError,
      this.continueText,
      this.profilePhoto,
      this.profileEmailPlacehold,
      this.profileBirthdayPlacehold,
      this.authorizeThisAccount,
      this.bigPoints,
      this.livePrayerNotificationDesc,
      this.beenWithUs,
      this.settings,
      this.changeEmailTitle,
      this.profileGender,
      this.ikhlasDigitalSadaqahDesc,
      this.givenName,
      this.requestAnotherEmail,
      this.notLoggedIn,
      this.myProfileTitle,
      this.loginOrRegister,
      this.cantDelete,
      this.otpMessage,
      this.requestNewOtp,
      this.recomendedAvatar,
      this.digitalIslamicLifestyleEcosystemDesc,
      this.dateOfBirth,
      this.bigMemberID,
      this.debugPage,
      this.sentInvitation,
      this.didntGetOtp,
      this.accountDeletionWrongEmail,
      this.limitedOtp,
      this.accountWillBeDeletedOn,
      this.dialingCode,
      this.mobileNumber,
      this.search,
      this.newPhonePlacehold,
      this.livePrayerNotification,
      this.setPasswordSub,
      this.profileSkip,
      this.checkProfileDialogSignOutBtn,
      this.ensure,
      this.emptyFieldMessage,
      this.logout,
      this.confirmLogout,
      this.or,
      this.noSetting,
      this.aboutToDeleteAccountPassword,
      this.invalidOtp,
      this.invalidEmailMessage,
      this.selectBirthday,
      this.checkProfileDialogTitle,
      this.profileFullName,
      this.female,
      this.cancel,
      this.accountDeletionInProcess,
      this.umhraTravelServices,
      this.logoutErrorTip,
      this.accountDetails,
      this.profileBirthday,
      this.resetTipContent,
      this.wantToDelete,
      this.umhraTravelServicesDesc,
      this.changePhoneCountry,
      this.oldPassword,
      this.hasSetting,
      this.popularCountries,
      this.account,
      this.dateErrorMessage,
      this.invalidDialingCode,
      this.newPassword,
      this.invalidPhoneMessage,
      this.verification,
      this.checkProfileDialogMessage,
      this.male,
      this.sadToLetGo,
      this.verificationLimitReached,
      this.changePhoneTitle,
      this.maximumOtp,
      this.finishCredits,
      this.setPasswordTitle,
      this.confirmPassword,
      this.inSeconds,
      this.activateYourAccount,
      this.resendEmail,
      this.changePhoneSub,
      this.emailPlacehold,
      this.verifyYourMobileNumber,
      this.fullNameSetting,
      this.aboutToDeleteAccountSocialMedia,
      this.familyName,
      this.accountSecurityTitle,
      this.updateProfileSuccessMessage,
      this.aboutToDelete,
      this.changePhoneCurrent,
      this.ikhlasDigitalSadaqah,
      this.requestAnotherEmailTimer,
      this.profileFullNamePlacehold,
      this.nameErrorMessage,
      this.signUp,
      this.updatePhoneNumber,
      this.personalInformation,
      this.profileTitle});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String? profileEmail;
  @override
  final String? changePhoneError;
  @override
  final String? deleteAccount;
  @override
  final String? deletingAccount;
  @override
  final String? profileGenderPlacehold;
  @override
  final String? tryAgainOtp;
  @override
  final String? oneMoreStep;
  @override
  final String? follow;
  @override
  final String? adFreeBrowsing;
  @override
  final String? digitalIslamicLifestyleEcosystem;
  @override
  final String? prayerSettings;
  @override
  final String? adFreeBrowsingDesc;
  @override
  final String? passwordDescription;
  @override
  final String? appVersion;
  @override
  final String? justInfoAboutYou;
  @override
  final String? enterYourPassword;
  @override
  final String? iAgree;
  @override
  final String? changeAvatarError;
  @override
  final String? continueText;
  @override
  final String? profilePhoto;
  @override
  final String? profileEmailPlacehold;
  @override
  final String? profileBirthdayPlacehold;
  @override
  final String? authorizeThisAccount;
  @override
  final String? bigPoints;
  @override
  final String? livePrayerNotificationDesc;
  @override
  final String? beenWithUs;
  @override
  final String? settings;
  @override
  final String? changeEmailTitle;
  @override
  final String? profileGender;
  @override
  final String? ikhlasDigitalSadaqahDesc;
  @override
  final String? givenName;
  @override
  final String? requestAnotherEmail;
  @override
  final String? notLoggedIn;
  @override
  final String? myProfileTitle;
  @override
  final String? loginOrRegister;
  @override
  final String? cantDelete;
  @override
  final String? otpMessage;
  @override
  final String? requestNewOtp;
  @override
  final String? recomendedAvatar;
  @override
  final String? digitalIslamicLifestyleEcosystemDesc;
  @override
  final String? dateOfBirth;
  @override
  final String? bigMemberID;
  @override
  final String? debugPage;
  @override
  final String? sentInvitation;
  @override
  final String? didntGetOtp;
  @override
  final String? accountDeletionWrongEmail;
  @override
  final String? limitedOtp;
  @override
  final String? accountWillBeDeletedOn;
  @override
  final String? dialingCode;
  @override
  final String? mobileNumber;
  @override
  final String? search;
  @override
  final String? newPhonePlacehold;
  @override
  final String? livePrayerNotification;
  @override
  final String? setPasswordSub;
  @override
  final String? profileSkip;
  @override
  final String? checkProfileDialogSignOutBtn;
  @override
  final String? ensure;
  @override
  final String? emptyFieldMessage;
  @override
  final String? logout;
  @override
  final String? confirmLogout;
  @override
  final String? or;
  @override
  final String? noSetting;
  @override
  final String? aboutToDeleteAccountPassword;
  @override
  final String? invalidOtp;
  @override
  final String? invalidEmailMessage;
  @override
  final String? selectBirthday;
  @override
  final String? checkProfileDialogTitle;
  @override
  final String? profileFullName;
  @override
  final String? female;
  @override
  final String? cancel;
  @override
  final String? accountDeletionInProcess;
  @override
  final String? umhraTravelServices;
  @override
  final String? logoutErrorTip;
  @override
  final String? accountDetails;
  @override
  final String? profileBirthday;
  @override
  final String? resetTipContent;
  @override
  final String? wantToDelete;
  @override
  final String? umhraTravelServicesDesc;
  @override
  final String? changePhoneCountry;
  @override
  final String? oldPassword;
  @override
  final String? hasSetting;
  @override
  final String? popularCountries;
  @override
  final String? account;
  @override
  final String? dateErrorMessage;
  @override
  final String? invalidDialingCode;
  @override
  final String? newPassword;
  @override
  final String? invalidPhoneMessage;
  @override
  final String? verification;
  @override
  final String? checkProfileDialogMessage;
  @override
  final String? male;
  @override
  final String? sadToLetGo;
  @override
  final String? verificationLimitReached;
  @override
  final String? changePhoneTitle;
  @override
  final String? maximumOtp;
  @override
  final String? finishCredits;
  @override
  final String? setPasswordTitle;
  @override
  final String? confirmPassword;
  @override
  final String? inSeconds;
  @override
  final String? activateYourAccount;
  @override
  final String? resendEmail;
  @override
  final String? changePhoneSub;
  @override
  final String? emailPlacehold;
  @override
  final String? verifyYourMobileNumber;
  @override
  final String? fullNameSetting;
  @override
  final String? aboutToDeleteAccountSocialMedia;
  @override
  final String? familyName;
  @override
  final String? accountSecurityTitle;
  @override
  final String? updateProfileSuccessMessage;
  @override
  final String? aboutToDelete;
  @override
  final String? changePhoneCurrent;
  @override
  final String? ikhlasDigitalSadaqah;
  @override
  final String? requestAnotherEmailTimer;
  @override
  final String? profileFullNamePlacehold;
  @override
  final String? nameErrorMessage;
  @override
  final String? signUp;
  @override
  final String? updatePhoneNumber;
  @override
  final String? personalInformation;
  @override
  final String? profileTitle;

  @override
  String toString() {
    return 'Account(profileEmail: $profileEmail, changePhoneError: $changePhoneError, deleteAccount: $deleteAccount, deletingAccount: $deletingAccount, profileGenderPlacehold: $profileGenderPlacehold, tryAgainOtp: $tryAgainOtp, oneMoreStep: $oneMoreStep, follow: $follow, adFreeBrowsing: $adFreeBrowsing, digitalIslamicLifestyleEcosystem: $digitalIslamicLifestyleEcosystem, prayerSettings: $prayerSettings, adFreeBrowsingDesc: $adFreeBrowsingDesc, passwordDescription: $passwordDescription, appVersion: $appVersion, justInfoAboutYou: $justInfoAboutYou, enterYourPassword: $enterYourPassword, iAgree: $iAgree, changeAvatarError: $changeAvatarError, continueText: $continueText, profilePhoto: $profilePhoto, profileEmailPlacehold: $profileEmailPlacehold, profileBirthdayPlacehold: $profileBirthdayPlacehold, authorizeThisAccount: $authorizeThisAccount, bigPoints: $bigPoints, livePrayerNotificationDesc: $livePrayerNotificationDesc, beenWithUs: $beenWithUs, settings: $settings, changeEmailTitle: $changeEmailTitle, profileGender: $profileGender, ikhlasDigitalSadaqahDesc: $ikhlasDigitalSadaqahDesc, givenName: $givenName, requestAnotherEmail: $requestAnotherEmail, notLoggedIn: $notLoggedIn, myProfileTitle: $myProfileTitle, loginOrRegister: $loginOrRegister, cantDelete: $cantDelete, otpMessage: $otpMessage, requestNewOtp: $requestNewOtp, recomendedAvatar: $recomendedAvatar, digitalIslamicLifestyleEcosystemDesc: $digitalIslamicLifestyleEcosystemDesc, dateOfBirth: $dateOfBirth, bigMemberID: $bigMemberID, debugPage: $debugPage, sentInvitation: $sentInvitation, didntGetOtp: $didntGetOtp, accountDeletionWrongEmail: $accountDeletionWrongEmail, limitedOtp: $limitedOtp, accountWillBeDeletedOn: $accountWillBeDeletedOn, dialingCode: $dialingCode, mobileNumber: $mobileNumber, search: $search, newPhonePlacehold: $newPhonePlacehold, livePrayerNotification: $livePrayerNotification, setPasswordSub: $setPasswordSub, profileSkip: $profileSkip, checkProfileDialogSignOutBtn: $checkProfileDialogSignOutBtn, ensure: $ensure, emptyFieldMessage: $emptyFieldMessage, logout: $logout, confirmLogout: $confirmLogout, or: $or, noSetting: $noSetting, aboutToDeleteAccountPassword: $aboutToDeleteAccountPassword, invalidOtp: $invalidOtp, invalidEmailMessage: $invalidEmailMessage, selectBirthday: $selectBirthday, checkProfileDialogTitle: $checkProfileDialogTitle, profileFullName: $profileFullName, female: $female, cancel: $cancel, accountDeletionInProcess: $accountDeletionInProcess, umhraTravelServices: $umhraTravelServices, logoutErrorTip: $logoutErrorTip, accountDetails: $accountDetails, profileBirthday: $profileBirthday, resetTipContent: $resetTipContent, wantToDelete: $wantToDelete, umhraTravelServicesDesc: $umhraTravelServicesDesc, changePhoneCountry: $changePhoneCountry, oldPassword: $oldPassword, hasSetting: $hasSetting, popularCountries: $popularCountries, account: $account, dateErrorMessage: $dateErrorMessage, invalidDialingCode: $invalidDialingCode, newPassword: $newPassword, invalidPhoneMessage: $invalidPhoneMessage, verification: $verification, checkProfileDialogMessage: $checkProfileDialogMessage, male: $male, sadToLetGo: $sadToLetGo, verificationLimitReached: $verificationLimitReached, changePhoneTitle: $changePhoneTitle, maximumOtp: $maximumOtp, finishCredits: $finishCredits, setPasswordTitle: $setPasswordTitle, confirmPassword: $confirmPassword, inSeconds: $inSeconds, activateYourAccount: $activateYourAccount, resendEmail: $resendEmail, changePhoneSub: $changePhoneSub, emailPlacehold: $emailPlacehold, verifyYourMobileNumber: $verifyYourMobileNumber, fullNameSetting: $fullNameSetting, aboutToDeleteAccountSocialMedia: $aboutToDeleteAccountSocialMedia, familyName: $familyName, accountSecurityTitle: $accountSecurityTitle, updateProfileSuccessMessage: $updateProfileSuccessMessage, aboutToDelete: $aboutToDelete, changePhoneCurrent: $changePhoneCurrent, ikhlasDigitalSadaqah: $ikhlasDigitalSadaqah, requestAnotherEmailTimer: $requestAnotherEmailTimer, profileFullNamePlacehold: $profileFullNamePlacehold, nameErrorMessage: $nameErrorMessage, signUp: $signUp, updatePhoneNumber: $updatePhoneNumber, personalInformation: $personalInformation, profileTitle: $profileTitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.profileEmail, profileEmail) ||
                other.profileEmail == profileEmail) &&
            (identical(other.changePhoneError, changePhoneError) ||
                other.changePhoneError == changePhoneError) &&
            (identical(other.deleteAccount, deleteAccount) ||
                other.deleteAccount == deleteAccount) &&
            (identical(other.deletingAccount, deletingAccount) ||
                other.deletingAccount == deletingAccount) &&
            (identical(other.profileGenderPlacehold, profileGenderPlacehold) ||
                other.profileGenderPlacehold == profileGenderPlacehold) &&
            (identical(other.tryAgainOtp, tryAgainOtp) ||
                other.tryAgainOtp == tryAgainOtp) &&
            (identical(other.oneMoreStep, oneMoreStep) ||
                other.oneMoreStep == oneMoreStep) &&
            (identical(other.follow, follow) || other.follow == follow) &&
            (identical(other.adFreeBrowsing, adFreeBrowsing) ||
                other.adFreeBrowsing == adFreeBrowsing) &&
            (identical(other.digitalIslamicLifestyleEcosystem, digitalIslamicLifestyleEcosystem) ||
                other.digitalIslamicLifestyleEcosystem ==
                    digitalIslamicLifestyleEcosystem) &&
            (identical(other.prayerSettings, prayerSettings) ||
                other.prayerSettings == prayerSettings) &&
            (identical(other.adFreeBrowsingDesc, adFreeBrowsingDesc) ||
                other.adFreeBrowsingDesc == adFreeBrowsingDesc) &&
            (identical(other.passwordDescription, passwordDescription) ||
                other.passwordDescription == passwordDescription) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.justInfoAboutYou, justInfoAboutYou) ||
                other.justInfoAboutYou == justInfoAboutYou) &&
            (identical(other.enterYourPassword, enterYourPassword) ||
                other.enterYourPassword == enterYourPassword) &&
            (identical(other.iAgree, iAgree) || other.iAgree == iAgree) &&
            (identical(other.changeAvatarError, changeAvatarError) ||
                other.changeAvatarError == changeAvatarError) &&
            (identical(other.continueText, continueText) ||
                other.continueText == continueText) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.profileEmailPlacehold, profileEmailPlacehold) ||
                other.profileEmailPlacehold == profileEmailPlacehold) &&
            (identical(other.profileBirthdayPlacehold, profileBirthdayPlacehold) ||
                other.profileBirthdayPlacehold == profileBirthdayPlacehold) &&
            (identical(other.authorizeThisAccount, authorizeThisAccount) ||
                other.authorizeThisAccount == authorizeThisAccount) &&
            (identical(other.bigPoints, bigPoints) ||
                other.bigPoints == bigPoints) &&
            (identical(other.livePrayerNotificationDesc, livePrayerNotificationDesc) ||
                other.livePrayerNotificationDesc ==
                    livePrayerNotificationDesc) &&
            (identical(other.beenWithUs, beenWithUs) ||
                other.beenWithUs == beenWithUs) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.changeEmailTitle, changeEmailTitle) ||
                other.changeEmailTitle == changeEmailTitle) &&
            (identical(other.profileGender, profileGender) ||
                other.profileGender == profileGender) &&
            (identical(other.ikhlasDigitalSadaqahDesc, ikhlasDigitalSadaqahDesc) ||
                other.ikhlasDigitalSadaqahDesc == ikhlasDigitalSadaqahDesc) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.requestAnotherEmail, requestAnotherEmail) ||
                other.requestAnotherEmail == requestAnotherEmail) &&
            (identical(other.notLoggedIn, notLoggedIn) ||
                other.notLoggedIn == notLoggedIn) &&
            (identical(other.myProfileTitle, myProfileTitle) ||
                other.myProfileTitle == myProfileTitle) &&
            (identical(other.loginOrRegister, loginOrRegister) || other.loginOrRegister == loginOrRegister) &&
            (identical(other.cantDelete, cantDelete) || other.cantDelete == cantDelete) &&
            (identical(other.otpMessage, otpMessage) || other.otpMessage == otpMessage) &&
            (identical(other.requestNewOtp, requestNewOtp) || other.requestNewOtp == requestNewOtp) &&
            (identical(other.recomendedAvatar, recomendedAvatar) || other.recomendedAvatar == recomendedAvatar) &&
            (identical(other.digitalIslamicLifestyleEcosystemDesc, digitalIslamicLifestyleEcosystemDesc) || other.digitalIslamicLifestyleEcosystemDesc == digitalIslamicLifestyleEcosystemDesc) &&
            (identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth) &&
            (identical(other.bigMemberID, bigMemberID) || other.bigMemberID == bigMemberID) &&
            (identical(other.debugPage, debugPage) || other.debugPage == debugPage) &&
            (identical(other.sentInvitation, sentInvitation) || other.sentInvitation == sentInvitation) &&
            (identical(other.didntGetOtp, didntGetOtp) || other.didntGetOtp == didntGetOtp) &&
            (identical(other.accountDeletionWrongEmail, accountDeletionWrongEmail) || other.accountDeletionWrongEmail == accountDeletionWrongEmail) &&
            (identical(other.limitedOtp, limitedOtp) || other.limitedOtp == limitedOtp) &&
            (identical(other.accountWillBeDeletedOn, accountWillBeDeletedOn) || other.accountWillBeDeletedOn == accountWillBeDeletedOn) &&
            (identical(other.dialingCode, dialingCode) || other.dialingCode == dialingCode) &&
            (identical(other.mobileNumber, mobileNumber) || other.mobileNumber == mobileNumber) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.newPhonePlacehold, newPhonePlacehold) || other.newPhonePlacehold == newPhonePlacehold) &&
            (identical(other.livePrayerNotification, livePrayerNotification) || other.livePrayerNotification == livePrayerNotification) &&
            (identical(other.setPasswordSub, setPasswordSub) || other.setPasswordSub == setPasswordSub) &&
            (identical(other.profileSkip, profileSkip) || other.profileSkip == profileSkip) &&
            (identical(other.checkProfileDialogSignOutBtn, checkProfileDialogSignOutBtn) || other.checkProfileDialogSignOutBtn == checkProfileDialogSignOutBtn) &&
            (identical(other.ensure, ensure) || other.ensure == ensure) &&
            (identical(other.emptyFieldMessage, emptyFieldMessage) || other.emptyFieldMessage == emptyFieldMessage) &&
            (identical(other.logout, logout) || other.logout == logout) &&
            (identical(other.confirmLogout, confirmLogout) || other.confirmLogout == confirmLogout) &&
            (identical(other.or, or) || other.or == or) &&
            (identical(other.noSetting, noSetting) || other.noSetting == noSetting) &&
            (identical(other.aboutToDeleteAccountPassword, aboutToDeleteAccountPassword) || other.aboutToDeleteAccountPassword == aboutToDeleteAccountPassword) &&
            (identical(other.invalidOtp, invalidOtp) || other.invalidOtp == invalidOtp) &&
            (identical(other.invalidEmailMessage, invalidEmailMessage) || other.invalidEmailMessage == invalidEmailMessage) &&
            (identical(other.selectBirthday, selectBirthday) || other.selectBirthday == selectBirthday) &&
            (identical(other.checkProfileDialogTitle, checkProfileDialogTitle) || other.checkProfileDialogTitle == checkProfileDialogTitle) &&
            (identical(other.profileFullName, profileFullName) || other.profileFullName == profileFullName) &&
            (identical(other.female, female) || other.female == female) &&
            (identical(other.cancel, cancel) || other.cancel == cancel) &&
            (identical(other.accountDeletionInProcess, accountDeletionInProcess) || other.accountDeletionInProcess == accountDeletionInProcess) &&
            (identical(other.umhraTravelServices, umhraTravelServices) || other.umhraTravelServices == umhraTravelServices) &&
            (identical(other.logoutErrorTip, logoutErrorTip) || other.logoutErrorTip == logoutErrorTip) &&
            (identical(other.accountDetails, accountDetails) || other.accountDetails == accountDetails) &&
            (identical(other.profileBirthday, profileBirthday) || other.profileBirthday == profileBirthday) &&
            (identical(other.resetTipContent, resetTipContent) || other.resetTipContent == resetTipContent) &&
            (identical(other.wantToDelete, wantToDelete) || other.wantToDelete == wantToDelete) &&
            (identical(other.umhraTravelServicesDesc, umhraTravelServicesDesc) || other.umhraTravelServicesDesc == umhraTravelServicesDesc) &&
            (identical(other.changePhoneCountry, changePhoneCountry) || other.changePhoneCountry == changePhoneCountry) &&
            (identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword) &&
            (identical(other.hasSetting, hasSetting) || other.hasSetting == hasSetting) &&
            (identical(other.popularCountries, popularCountries) || other.popularCountries == popularCountries) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.dateErrorMessage, dateErrorMessage) || other.dateErrorMessage == dateErrorMessage) &&
            (identical(other.invalidDialingCode, invalidDialingCode) || other.invalidDialingCode == invalidDialingCode) &&
            (identical(other.newPassword, newPassword) || other.newPassword == newPassword) &&
            (identical(other.invalidPhoneMessage, invalidPhoneMessage) || other.invalidPhoneMessage == invalidPhoneMessage) &&
            (identical(other.verification, verification) || other.verification == verification) &&
            (identical(other.checkProfileDialogMessage, checkProfileDialogMessage) || other.checkProfileDialogMessage == checkProfileDialogMessage) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.sadToLetGo, sadToLetGo) || other.sadToLetGo == sadToLetGo) &&
            (identical(other.verificationLimitReached, verificationLimitReached) || other.verificationLimitReached == verificationLimitReached) &&
            (identical(other.changePhoneTitle, changePhoneTitle) || other.changePhoneTitle == changePhoneTitle) &&
            (identical(other.maximumOtp, maximumOtp) || other.maximumOtp == maximumOtp) &&
            (identical(other.finishCredits, finishCredits) || other.finishCredits == finishCredits) &&
            (identical(other.setPasswordTitle, setPasswordTitle) || other.setPasswordTitle == setPasswordTitle) &&
            (identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword) &&
            (identical(other.inSeconds, inSeconds) || other.inSeconds == inSeconds) &&
            (identical(other.activateYourAccount, activateYourAccount) || other.activateYourAccount == activateYourAccount) &&
            (identical(other.resendEmail, resendEmail) || other.resendEmail == resendEmail) &&
            (identical(other.changePhoneSub, changePhoneSub) || other.changePhoneSub == changePhoneSub) &&
            (identical(other.emailPlacehold, emailPlacehold) || other.emailPlacehold == emailPlacehold) &&
            (identical(other.verifyYourMobileNumber, verifyYourMobileNumber) || other.verifyYourMobileNumber == verifyYourMobileNumber) &&
            (identical(other.fullNameSetting, fullNameSetting) || other.fullNameSetting == fullNameSetting) &&
            (identical(other.aboutToDeleteAccountSocialMedia, aboutToDeleteAccountSocialMedia) || other.aboutToDeleteAccountSocialMedia == aboutToDeleteAccountSocialMedia) &&
            (identical(other.familyName, familyName) || other.familyName == familyName) &&
            (identical(other.accountSecurityTitle, accountSecurityTitle) || other.accountSecurityTitle == accountSecurityTitle) &&
            (identical(other.updateProfileSuccessMessage, updateProfileSuccessMessage) || other.updateProfileSuccessMessage == updateProfileSuccessMessage) &&
            (identical(other.aboutToDelete, aboutToDelete) || other.aboutToDelete == aboutToDelete) &&
            (identical(other.changePhoneCurrent, changePhoneCurrent) || other.changePhoneCurrent == changePhoneCurrent) &&
            (identical(other.ikhlasDigitalSadaqah, ikhlasDigitalSadaqah) || other.ikhlasDigitalSadaqah == ikhlasDigitalSadaqah) &&
            (identical(other.requestAnotherEmailTimer, requestAnotherEmailTimer) || other.requestAnotherEmailTimer == requestAnotherEmailTimer) &&
            (identical(other.profileFullNamePlacehold, profileFullNamePlacehold) || other.profileFullNamePlacehold == profileFullNamePlacehold) &&
            (identical(other.nameErrorMessage, nameErrorMessage) || other.nameErrorMessage == nameErrorMessage) &&
            (identical(other.signUp, signUp) || other.signUp == signUp) &&
            (identical(other.updatePhoneNumber, updatePhoneNumber) || other.updatePhoneNumber == updatePhoneNumber) &&
            (identical(other.personalInformation, personalInformation) || other.personalInformation == personalInformation) &&
            (identical(other.profileTitle, profileTitle) || other.profileTitle == profileTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        profileEmail,
        changePhoneError,
        deleteAccount,
        deletingAccount,
        profileGenderPlacehold,
        tryAgainOtp,
        oneMoreStep,
        follow,
        adFreeBrowsing,
        digitalIslamicLifestyleEcosystem,
        prayerSettings,
        adFreeBrowsingDesc,
        passwordDescription,
        appVersion,
        justInfoAboutYou,
        enterYourPassword,
        iAgree,
        changeAvatarError,
        continueText,
        profilePhoto,
        profileEmailPlacehold,
        profileBirthdayPlacehold,
        authorizeThisAccount,
        bigPoints,
        livePrayerNotificationDesc,
        beenWithUs,
        settings,
        changeEmailTitle,
        profileGender,
        ikhlasDigitalSadaqahDesc,
        givenName,
        requestAnotherEmail,
        notLoggedIn,
        myProfileTitle,
        loginOrRegister,
        cantDelete,
        otpMessage,
        requestNewOtp,
        recomendedAvatar,
        digitalIslamicLifestyleEcosystemDesc,
        dateOfBirth,
        bigMemberID,
        debugPage,
        sentInvitation,
        didntGetOtp,
        accountDeletionWrongEmail,
        limitedOtp,
        accountWillBeDeletedOn,
        dialingCode,
        mobileNumber,
        search,
        newPhonePlacehold,
        livePrayerNotification,
        setPasswordSub,
        profileSkip,
        checkProfileDialogSignOutBtn,
        ensure,
        emptyFieldMessage,
        logout,
        confirmLogout,
        or,
        noSetting,
        aboutToDeleteAccountPassword,
        invalidOtp,
        invalidEmailMessage,
        selectBirthday,
        checkProfileDialogTitle,
        profileFullName,
        female,
        cancel,
        accountDeletionInProcess,
        umhraTravelServices,
        logoutErrorTip,
        accountDetails,
        profileBirthday,
        resetTipContent,
        wantToDelete,
        umhraTravelServicesDesc,
        changePhoneCountry,
        oldPassword,
        hasSetting,
        popularCountries,
        account,
        dateErrorMessage,
        invalidDialingCode,
        newPassword,
        invalidPhoneMessage,
        verification,
        checkProfileDialogMessage,
        male,
        sadToLetGo,
        verificationLimitReached,
        changePhoneTitle,
        maximumOtp,
        finishCredits,
        setPasswordTitle,
        confirmPassword,
        inSeconds,
        activateYourAccount,
        resendEmail,
        changePhoneSub,
        emailPlacehold,
        verifyYourMobileNumber,
        fullNameSetting,
        aboutToDeleteAccountSocialMedia,
        familyName,
        accountSecurityTitle,
        updateProfileSuccessMessage,
        aboutToDelete,
        changePhoneCurrent,
        ikhlasDigitalSadaqah,
        requestAnotherEmailTimer,
        profileFullNamePlacehold,
        nameErrorMessage,
        signUp,
        updatePhoneNumber,
        personalInformation,
        profileTitle
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {final String? profileEmail,
      final String? changePhoneError,
      final String? deleteAccount,
      final String? deletingAccount,
      final String? profileGenderPlacehold,
      final String? tryAgainOtp,
      final String? oneMoreStep,
      final String? follow,
      final String? adFreeBrowsing,
      final String? digitalIslamicLifestyleEcosystem,
      final String? prayerSettings,
      final String? adFreeBrowsingDesc,
      final String? passwordDescription,
      final String? appVersion,
      final String? justInfoAboutYou,
      final String? enterYourPassword,
      final String? iAgree,
      final String? changeAvatarError,
      final String? continueText,
      final String? profilePhoto,
      final String? profileEmailPlacehold,
      final String? profileBirthdayPlacehold,
      final String? authorizeThisAccount,
      final String? bigPoints,
      final String? livePrayerNotificationDesc,
      final String? beenWithUs,
      final String? settings,
      final String? changeEmailTitle,
      final String? profileGender,
      final String? ikhlasDigitalSadaqahDesc,
      final String? givenName,
      final String? requestAnotherEmail,
      final String? notLoggedIn,
      final String? myProfileTitle,
      final String? loginOrRegister,
      final String? cantDelete,
      final String? otpMessage,
      final String? requestNewOtp,
      final String? recomendedAvatar,
      final String? digitalIslamicLifestyleEcosystemDesc,
      final String? dateOfBirth,
      final String? bigMemberID,
      final String? debugPage,
      final String? sentInvitation,
      final String? didntGetOtp,
      final String? accountDeletionWrongEmail,
      final String? limitedOtp,
      final String? accountWillBeDeletedOn,
      final String? dialingCode,
      final String? mobileNumber,
      final String? search,
      final String? newPhonePlacehold,
      final String? livePrayerNotification,
      final String? setPasswordSub,
      final String? profileSkip,
      final String? checkProfileDialogSignOutBtn,
      final String? ensure,
      final String? emptyFieldMessage,
      final String? logout,
      final String? confirmLogout,
      final String? or,
      final String? noSetting,
      final String? aboutToDeleteAccountPassword,
      final String? invalidOtp,
      final String? invalidEmailMessage,
      final String? selectBirthday,
      final String? checkProfileDialogTitle,
      final String? profileFullName,
      final String? female,
      final String? cancel,
      final String? accountDeletionInProcess,
      final String? umhraTravelServices,
      final String? logoutErrorTip,
      final String? accountDetails,
      final String? profileBirthday,
      final String? resetTipContent,
      final String? wantToDelete,
      final String? umhraTravelServicesDesc,
      final String? changePhoneCountry,
      final String? oldPassword,
      final String? hasSetting,
      final String? popularCountries,
      final String? account,
      final String? dateErrorMessage,
      final String? invalidDialingCode,
      final String? newPassword,
      final String? invalidPhoneMessage,
      final String? verification,
      final String? checkProfileDialogMessage,
      final String? male,
      final String? sadToLetGo,
      final String? verificationLimitReached,
      final String? changePhoneTitle,
      final String? maximumOtp,
      final String? finishCredits,
      final String? setPasswordTitle,
      final String? confirmPassword,
      final String? inSeconds,
      final String? activateYourAccount,
      final String? resendEmail,
      final String? changePhoneSub,
      final String? emailPlacehold,
      final String? verifyYourMobileNumber,
      final String? fullNameSetting,
      final String? aboutToDeleteAccountSocialMedia,
      final String? familyName,
      final String? accountSecurityTitle,
      final String? updateProfileSuccessMessage,
      final String? aboutToDelete,
      final String? changePhoneCurrent,
      final String? ikhlasDigitalSadaqah,
      final String? requestAnotherEmailTimer,
      final String? profileFullNamePlacehold,
      final String? nameErrorMessage,
      final String? signUp,
      final String? updatePhoneNumber,
      final String? personalInformation,
      final String? profileTitle}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String? get profileEmail;
  @override
  String? get changePhoneError;
  @override
  String? get deleteAccount;
  @override
  String? get deletingAccount;
  @override
  String? get profileGenderPlacehold;
  @override
  String? get tryAgainOtp;
  @override
  String? get oneMoreStep;
  @override
  String? get follow;
  @override
  String? get adFreeBrowsing;
  @override
  String? get digitalIslamicLifestyleEcosystem;
  @override
  String? get prayerSettings;
  @override
  String? get adFreeBrowsingDesc;
  @override
  String? get passwordDescription;
  @override
  String? get appVersion;
  @override
  String? get justInfoAboutYou;
  @override
  String? get enterYourPassword;
  @override
  String? get iAgree;
  @override
  String? get changeAvatarError;
  @override
  String? get continueText;
  @override
  String? get profilePhoto;
  @override
  String? get profileEmailPlacehold;
  @override
  String? get profileBirthdayPlacehold;
  @override
  String? get authorizeThisAccount;
  @override
  String? get bigPoints;
  @override
  String? get livePrayerNotificationDesc;
  @override
  String? get beenWithUs;
  @override
  String? get settings;
  @override
  String? get changeEmailTitle;
  @override
  String? get profileGender;
  @override
  String? get ikhlasDigitalSadaqahDesc;
  @override
  String? get givenName;
  @override
  String? get requestAnotherEmail;
  @override
  String? get notLoggedIn;
  @override
  String? get myProfileTitle;
  @override
  String? get loginOrRegister;
  @override
  String? get cantDelete;
  @override
  String? get otpMessage;
  @override
  String? get requestNewOtp;
  @override
  String? get recomendedAvatar;
  @override
  String? get digitalIslamicLifestyleEcosystemDesc;
  @override
  String? get dateOfBirth;
  @override
  String? get bigMemberID;
  @override
  String? get debugPage;
  @override
  String? get sentInvitation;
  @override
  String? get didntGetOtp;
  @override
  String? get accountDeletionWrongEmail;
  @override
  String? get limitedOtp;
  @override
  String? get accountWillBeDeletedOn;
  @override
  String? get dialingCode;
  @override
  String? get mobileNumber;
  @override
  String? get search;
  @override
  String? get newPhonePlacehold;
  @override
  String? get livePrayerNotification;
  @override
  String? get setPasswordSub;
  @override
  String? get profileSkip;
  @override
  String? get checkProfileDialogSignOutBtn;
  @override
  String? get ensure;
  @override
  String? get emptyFieldMessage;
  @override
  String? get logout;
  @override
  String? get confirmLogout;
  @override
  String? get or;
  @override
  String? get noSetting;
  @override
  String? get aboutToDeleteAccountPassword;
  @override
  String? get invalidOtp;
  @override
  String? get invalidEmailMessage;
  @override
  String? get selectBirthday;
  @override
  String? get checkProfileDialogTitle;
  @override
  String? get profileFullName;
  @override
  String? get female;
  @override
  String? get cancel;
  @override
  String? get accountDeletionInProcess;
  @override
  String? get umhraTravelServices;
  @override
  String? get logoutErrorTip;
  @override
  String? get accountDetails;
  @override
  String? get profileBirthday;
  @override
  String? get resetTipContent;
  @override
  String? get wantToDelete;
  @override
  String? get umhraTravelServicesDesc;
  @override
  String? get changePhoneCountry;
  @override
  String? get oldPassword;
  @override
  String? get hasSetting;
  @override
  String? get popularCountries;
  @override
  String? get account;
  @override
  String? get dateErrorMessage;
  @override
  String? get invalidDialingCode;
  @override
  String? get newPassword;
  @override
  String? get invalidPhoneMessage;
  @override
  String? get verification;
  @override
  String? get checkProfileDialogMessage;
  @override
  String? get male;
  @override
  String? get sadToLetGo;
  @override
  String? get verificationLimitReached;
  @override
  String? get changePhoneTitle;
  @override
  String? get maximumOtp;
  @override
  String? get finishCredits;
  @override
  String? get setPasswordTitle;
  @override
  String? get confirmPassword;
  @override
  String? get inSeconds;
  @override
  String? get activateYourAccount;
  @override
  String? get resendEmail;
  @override
  String? get changePhoneSub;
  @override
  String? get emailPlacehold;
  @override
  String? get verifyYourMobileNumber;
  @override
  String? get fullNameSetting;
  @override
  String? get aboutToDeleteAccountSocialMedia;
  @override
  String? get familyName;
  @override
  String? get accountSecurityTitle;
  @override
  String? get updateProfileSuccessMessage;
  @override
  String? get aboutToDelete;
  @override
  String? get changePhoneCurrent;
  @override
  String? get ikhlasDigitalSadaqah;
  @override
  String? get requestAnotherEmailTimer;
  @override
  String? get profileFullNamePlacehold;
  @override
  String? get nameErrorMessage;
  @override
  String? get signUp;
  @override
  String? get updatePhoneNumber;
  @override
  String? get personalInformation;
  @override
  String? get profileTitle;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
