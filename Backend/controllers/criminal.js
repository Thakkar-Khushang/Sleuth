const getDangerLevel = (crimes) => {
    let level = 0;
    let lowLevelCrimes = 0;
    let mediumLevelCrimes = 0;
    let highLevelCrimes = 0;
    for (let i = 0; i < crimes.length; i++) {
      let crime = crimes[i].toLowerCase();
      if (
        crime.includes("rape") ||
        crime.includes("harrasement") ||
        crime.includes("murder") ||
        crime.includes("assault") ||
        crime.includes("violence") ||
        crime.includes("abuse") ||
        crime.includes("kidnapping")
      ) {
        highLevelCrimes += 1;
      }
      if (
        crime.includes("fraud") ||
        crime.includes("scam") ||
        crime.includes("bribery") ||
        crime.includes("burglary") ||
        crime.includes("robbery") ||
        crime.includes("embezzlement") ||
        crime.includes("extortion")
      ) {
        mediumLevelCrimes += 1;
      }
      if (
        crime.includes("theft") ||
        crime.includes("vandalism") ||
        crime.includes("stolen goods") ||
        crime.includes("drugs") ||
        crime.includes("traffic") ||
        crime.includes("trespassing")
      ) {
        lowLevelCrimes += 1;
      }
    }
    if (highLevelCrimes > 0) {
      level = 90;
    } else if (mediumLevelCrimes > 0) {
      level = 40;
      mediumLevelCrimes -= 1;
    } else if (lowLevelCrimes > 0) {
      level = 20;
      lowLevelCrimes -= 1;
    }
  
    while (mediumLevelCrimes > 0 && level < 80) {
      level += 10;
      mediumLevelCrimes -= 1;
    }
  
    while (lowLevelCrimes > 0 && level < 60) {
      level += 5;
      lowLevelCrimes -= 1;
    }
  
    if (highLevelCrimes > 1) {
      level = 100;
    }
    return level;
  };