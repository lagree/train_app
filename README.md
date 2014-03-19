== README

Train App
Steve Lagree
3/19/2014

This is a simple app to upload, view, and manage train route information.  
It expects you to upload CSV files with four columns in the order of Train Line, Route Name, Run Number, and Operator ID.  The first column of your CSV must be a header file.
It uses ruby on rails with a postgresql database.  

To get a fresh copy use
git clone https://github.com/lagree/train_app.git


* Ruby version
The major requirements are ruby 2.1.0 and rails 4.0.3.  Check the Gemfile for additional gem requirements.
If you have bundler (gem install bundler), use
	bundle install

* System dependencies
This application uses postgresql hosted on heroku.  Any system that can run rails and the required gems will work.

* How to run the test suite
In the root directory of this application, run:
rspec
This will run all tests, including controller and integration tests.
All of the tests are in the spec/ directory.

* Database creation
	rake db:migrate RAILS_ENV="production" 

* Deployment instructions
I am using heroku to deploy the server. It is located at
http://boiling-beach-8498.herokuapp.com/

Make sure you have the versions of the gems listed in the Gemfile and have created the database before running locally. 
To run the production server locally, use
	rails s -e production

To access the site once the server is running, point your browser to
http://localhost:3000/