#  iAdopt
[![Build Status](https://travis-ci.com/BrentMifsud/iAdopt.svg?branch=master)](https://travis-ci.com/BrentMifsud/iAdopt)

![App Icon](/iAdopt/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png)

## Overview

This app uses the [getyourpet.com](https://getyourpet.com/api-documentation/) api to show pet adoption listings.

## Usage

This app can work without an API key, however requests are limited to 1 every 15 seconds. Performance will be negatively impacted without one.

To get an API key, please visit the Get Your Pet api [documentation](https://getyourpet.com/api-documentation/).

Once you have an API key, add it to the [constants file](/iAdopt/Networking/Get%20Your%20Pet%20Client/GetYourPetClient+Constants.swift) 

![Api Instructions Image](/images/addApiKey.png)

## Credits

Pet adoption listings are provided by: 

[![Get Your Pet](/iAdopt/Assets.xcassets/GetYourPetLogo.imageset/GetYourPet.png)](https://getyourpet.com)
