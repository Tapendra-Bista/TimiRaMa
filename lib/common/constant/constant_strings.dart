// ---------------------Contstant Strings----------------

import 'package:timirama/common/localization/enums/enums.dart';
import 'package:get/get.dart';

class AppStrings {
  //---------------  image  path strings-------------------
  static const String logoImage = 'assets/images/logo.png';
  static const String googleLogo = 'assets/images/google_logo.svg';
  static const String email = 'assets/images/email.json';
  static const String emailVerifed = 'assets/images/email_verifed.json';
  static const String couple = 'assets/images/couple.png';

  static const String uploadImage = 'assets/images/upload_image.json';
  //---------------- fonts  path strings-------------------------

  static const String robotoLight = 'assets/fonts/Roboto-Light.ttf';
  static const String robotosSemiBold = 'assets/fonts/Roboto-SemiBold.ttf';
  static const String robotThin = 'assets/fonts/Roboto-Thin.ttf';

  //-----------------User interests -----------------------------
static Map<String, List<String>> categorizedUserInterests = {
  "Friendship": [
    EnumLocale.chatting.name.tr,
    EnumLocale.makingNewFriends.name.tr,
    EnumLocale.studyBuddy.name.tr,
    EnumLocale.movieNights.name.tr,
    EnumLocale.coffeeHangouts.name.tr,
    EnumLocale.groupActivities.name.tr,
    EnumLocale.picnicPartner.name.tr,
    EnumLocale.bookClub.name.tr,
    EnumLocale.boardGames.name.tr,
    EnumLocale.volunteering.name.tr,
  ],
  "Love & Romance": [
    EnumLocale.romanticDates.name.tr,
    EnumLocale.candlelight.name.tr,
    EnumLocale.sweet.name.tr,
    EnumLocale.slowDancing.name.tr,
    EnumLocale.loveLetters.name.tr,
    EnumLocale.longWalks.name.tr,
    EnumLocale.holdingHands.name.tr,
    EnumLocale.poetry.name.tr,
    EnumLocale.surpriseGifts.name.tr,
    EnumLocale.stargazing.name.tr,
  ],
  "Sports & Outdoors": [
    EnumLocale.football.name.tr,
    EnumLocale.yoga.name.tr,
    EnumLocale.hiking.name.tr,
    EnumLocale.running.name.tr,
    EnumLocale.cycling.name.tr,
    EnumLocale.swimming.name.tr,
    EnumLocale.trekking.name.tr,
    EnumLocale.skating.name.tr,
    EnumLocale.rockClimbing.name.tr,
    EnumLocale.natureWalks.name.tr,
  ],
  "Food & Restaurants": [
    EnumLocale.foodie.name.tr,
    EnumLocale.streetFood.name.tr,
    EnumLocale.fineDining.name.tr,
    EnumLocale.coffeeLover.name.tr,
    EnumLocale.baking.name.tr,
    EnumLocale.homeCooking.name.tr,
    EnumLocale.veganCuisine.name.tr,
    EnumLocale.dessertLover.name.tr,
    EnumLocale.cookingTogether.name.tr,
    EnumLocale.restaurantHopper.name.tr,
  ],
  "Adventure & Travel": [
    EnumLocale.backpacking.name.tr,
    EnumLocale.roadTrips.name.tr,
    EnumLocale.soloTravel.name.tr,
    EnumLocale.camping.name.tr,
    EnumLocale.cityBreaks.name.tr,
    EnumLocale.jungleSafari.name.tr,
    EnumLocale.scubaDiving.name.tr,
    EnumLocale.mountainBiking.name.tr,
    EnumLocale.culturalTours.name.tr,
    EnumLocale.beachHolidays.name.tr,
  ],
  "Passion": [
    EnumLocale.music.name.tr,
    EnumLocale.creativity.name.tr,
    EnumLocale.fitness.name.tr,
    EnumLocale.travel.name.tr,
    EnumLocale.fashion.name.tr,
    EnumLocale.photography.name.tr,
    EnumLocale.reading.name.tr,
    EnumLocale.writing.name.tr,
    EnumLocale.technology.name.tr,
    EnumLocale.dance.name.tr,
  ],
};

static List<String> passion = categorizedUserInterests["Passion"]!;


  static const cloudName = "tbistaxmok1";
  static const uploadPreset = "timiramak015";

  //-----guideline violation  list-------
  static List<String> guidelineViolationList = [
    EnumLocale.underAge.name.tr,
    EnumLocale.depictionOfViolation.name.tr,
    EnumLocale.incorrectProfileDetails.name.tr,
    EnumLocale.abusiveOrIntrusiveBehavior.name.tr,
    EnumLocale.sexualContent.name.tr,
    EnumLocale.spamOrAdvertising.name.tr,
    EnumLocale.dubiousOffers.name.tr,
    EnumLocale.drugs.name.tr,
    EnumLocale.someoneIsInDanger.name.tr,
  ];

  //------------- illegel content-------------
  static List<String> illegalContentList = [
    EnumLocale.invasionOfPrivacy.name.tr,
    EnumLocale.attemptedFraud.name.tr,
    EnumLocale.threadsOrMalliciousStatements.name.tr,
    EnumLocale.sexualHarassment.name.tr,
    EnumLocale.childrenAreAtRisk.name.tr,
    EnumLocale.drugTrafficking.name.tr,
    EnumLocale.racismOrTerrorism.name.tr,
    EnumLocale.blackmail.name.tr,
    EnumLocale.deprivationOfLiberty.name.tr,
  ];

  static List<String> reelsFilterItems = [
    EnumLocale.archive.name.tr,
    EnumLocale.Favorite.name.tr,
    EnumLocale.following.name.tr,
  ];
}
