# Weather-Detector

This Weather Detector app takes your IP address, city, and country and returns your global location using longitude and latitude. Following this, it gets your local highs and lows for the next seven days. These basic steps will get you started!

This program uses ```Ruby 3.0.3```. 

# Getting started
To get started, run:
   
    $ git clone git@github.com:Braden-077/Weather-Detector.git
    
Then change directories into your clone and run: 

    $ bundle install

# Basic Use
You'll need to clone the repository and change into your directory for the app. 
Once you've cloned the repository, run:
    
    $ ruby lib/retrieve_weather.rb 
    
 This will simply get your IP Address, city, country, and the high and low temperatures for the next 7 days. It will also give you a url link with a graph displaying your weather in degrees(°) Fahrenheit. 
 
 
# Getting your results as a chart
 If you want to get the image of the graph as well as the url, you need to make sure you're using an image supported terminal, ```iTerm2``` is an example of such. Otherwise, just copying the link into your browser will do!
 

# Running Tests
However, if you plan to run tests, you'll want to run: 

    $ bundle install
  
 This app uses Rspec as a testing platform. Should you want to run these tests, type:
 
    $ bundle exec rspec 
 
 into your terminal. That command will have Rspec test all of the tests and it should give you a working result!


