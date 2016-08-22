
Task Instructions
--------------------------------------------------------------------------------
The Pelicanconnect database stores information on its members.
Each member can be associated with 1 or more school.

You should build a demo that allows someone to add a new member with
the fields “Name”, “Email Address” and "School" (selected from a list).

Secondly it should display all members for a selected school.

You may use any freely available programming language and modules.
We will want to run and connect to your code on our own machines so if there
are any unusual pre-requisites please document them.

You must not spend more than seven hours on the task.

How I worked
--------------------------------------------------------------------------------
I aimed to complete the challenge in a test driven manner.
I wrote automated integration tests with RSpec/Capybara to represent user
actions through the application and automated unit tests for the models with RSpec.
I have made use of various additional library including FactoryGirl, DatabaseCleaner
and Shoulda to provide additional functionality to my test suites.

Installation Instructions
--------------------------------------------------------------------------------
Clone down from bitbucket and cd into directory
$ git clone git@bitbucket.org:danielagsb/pelicanconnect.git
$ cd pelicanconnect

Create the database and carry out migrations
$ bin/rake db:create
$ bin/rake db:migrate

Run the app
$ bin/rails s

Missing / Future Improvements
--------------------------------------------------------------------------------
Given the limited time given I focused on the back-end of the app.
Had I had more time I would have focused mainly on:
- Improving the front-end using angular and bootstrap
- Included a search function in the students and schools' page
- Improved the tests particularly on the controllers and missing edge cases
