String getFullName(String shortName) {
  if (shortName == "ELEC")
    return "Electricity";
  else if (shortName == "WAT")
    return "Water";
  else if (shortName == "GAS")
    return "Gas";
  else if (shortName == "EDU")
    return "Education";
  else if (shortName == "NET")
    return "Internet";
  else if (shortName == "CARD")
    return "Credit Card";
  else if (shortName == "TEL")
    return "Telephone";
  else if (shortName == "TV")
    return "Television";
  else
    return "Others";
}
