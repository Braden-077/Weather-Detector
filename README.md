# Weather-Detector

This Weather Detector app takes your IP address, city, and country and returns your global location using longitude and latitude. Following this, it gets your local highs and lows for the next seven days. These basic steps will get you started!

This program uses ```Ruby 3.0.3```.

# Basic Use
You'll need to clone the repository and change into your directory for the app. 
Once you've cloned the repository, run:
    
    ruby lib/retrieve_weather.rb 
    
 This will simply get your IP Address, city, country, and the high and low temperatures for the next 7 days.

# Running Tests
However, if you plan to run tests, you'll want to run: 

    bundle install
  
 This app uses Rspec as a testing platform. Should you want to run these tests, type:
 
    bundle exec rspec 
 
 into your terminal. That command will have Rspec test all of the tests and it should give you a working result!


