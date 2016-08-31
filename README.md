
Task Instructions
--------------------------------------------------------------------------------
As an administrator, to keep track of my clients, I want a Student database       
that stores information on its members.(Each member can be associated with 1 or more school.)               

As an administrator, to keep my database updated, I want to be able to add new members   
with the fields “Name”, “Email Address” and "School" (selected from a list).   

As an administrator I want to see all members from a selected school.         

Installation Instructions
--------------------------------------------------------------------------------
Clone and cd into directory           
$ git clone git@bitbucket.org:danielagsb/student-directory.git        
$ cd student-directory     

Create the database and carry out migrations           
$ bin/rake db:create           
$ bin/rake db:migrate         

Run the app          
$ bin/rails s             

Technologies Used
--------------------------------------------------------------------------------
Automated integration tests with RSpec/Capybara to represent user
actions through the application and automated unit tests for the models with RSpec.       
Additional libraries used include FactoryGirl, DatabaseCleaner
and Shoulda to provide additional functionality to the test suites.
