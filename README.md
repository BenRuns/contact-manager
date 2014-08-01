
This is a contact manager being written for exercise purposes

Setting up  :

Requires postgres installed and ruby on rails 


To get the server running locally on http://localhost:3000/

	Git clone repo to a local file
	Go to the appropriate directory in the command line

	bundle install

	rake db:create
	rake db:migrate
	rails s

To create fake data for the app use 
   Running the below will reset the local db in addition to adding fake data

	rake db:populate 
	File for populating data uses 'faker' gem
	located at app/lib/tasks/sample_data.rake


-Fields

- first name
- middle name
- street address
- city
- state
- country
- postal code
- phone number
- email



-Intended features

- search for a contact
- add new contact
- edit existing contact
- delete existing contact

- Intended Stack

  ruby
  rails
  erb
  html, css, javascript
  minitest/spec
  postgresql
  rbenv
  bundler