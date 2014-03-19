== README

Train App
Steve Lagree
3/19/2014

This is a simple app to upload, view, and manage train route information.  It uses ruby on rails with an SQL database.  
To get a fresh copy use
git clone https://github.com/lagree/train_app.git


* Ruby version
The major requirements are ruby 2.1.0 and rails 4.0.3.  Check the Gemfile for additional gem requirements.

* System dependencies
This application uses sqlite as a database.  This could be easily changed to use MySQL or Postgres.

* Database creation
rake db:migrate RAILS_ENV="production" 

* How to run the test suite
In the root directory of this application, run:
rspec

This will run all tests, including controller and integration tests.



* Deployment instructions
I am using heroku to deploy the server. It is located at
http://boiling-beach-8498.herokuapp.com/

To run the server locally use the following
Production:
	rails s -e production

To access the site once the server is running, point your browser to
http://localhost:3000/