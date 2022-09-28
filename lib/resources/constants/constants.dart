//  ------------------------------- Main Variables ----------------------------

String lang = '';
String db = "mainDB.db";

RegExp regexpSuffix = RegExp(r'([.]*0)(?!.*\d)');
RegExp regexpPrefix = new RegExp(r'^0+(?=.)');

//  ------------------------------- Page Padding -----------------------=------

const double top = 30;
const double bottom = 40;
const double side = 25;

//  ------------------------------- Element Spacing & Sizing ------------------
// ----------------------------------- WILL BE CHANGED ------------------------
const double space0 = 10;
const double space1 = 15;
const double space2 = 20;
const double space3 = 30;

const double height1 = 50;
const double height2 = 65;
const double height3 = 75;
const double height4 = 115;
const double height5 = 130;
const double height6 = 160;

const double round = 15;

// ----------------------------------- Enum -----------------------------------
enum NavbarItem { home, settings, profile }

