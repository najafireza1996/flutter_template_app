enum LocalDbKey { userInfo, credentials, rememberMe, themeType, timeZone }


enum Gender { male, female }

enum ServerMode { local, test, main }

enum ShapeTypeIhio {
  ampoule,
  insulin,
  tablet,
  capsule,
  spray,
  gel,
  drop,
  powder,
  syrup,
  other
}

enum PrescriptionOperation { newPrescription, renewPrescription }

enum Result { success, failed }

enum ScaleHeight { veryLow, low, medium, high }

enum CallerPage { prescription, favourite }

enum SearchDateFilter { isOpen, isClosed }

enum SearchDateFilterActivity { active, inactive }

enum SettingSortFavourite { alphabetical, custom }

enum FaveDrugFilter { coveredDrug, unCoveredDrug }

enum ActionType { add, edit, delete }

enum IconSize { small, normal, large }

enum ThemeType { light, dark }

enum StyleType { primary, secondary, tertiary, error }

enum IhioLoginStep { userPassStep, otpStep }

enum LoginType { none, ihio, nationalCode }

enum NationalCodeLoginStep {
  nationalCodeStep,
  passwordStep,
  mobileNumberStep,
  verifyMobileNumberStep,
  otpStep,
  selectRoleStep,
  registerGetPasswordStep,
  registerGetMobileNumberStep,
  registerVerifyMobileNumberStep,
  registerTenantManagerStep,
  registerIhioInfoStep,
  registerConfirmIhioInfoStep
}

enum PatientFileType { add, edit }

enum InquiryType { patient, prescription }

enum InsuranceType { salamat, tamin, militaryForces, noInsurance, unknown }

enum TenantSetting { active, inactive }
