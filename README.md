Vent.it
======

[![Build Status](https://travis-ci.org/chanhpark/vent.it.svg)](https://travis-ci.org/chanhpark/vent.it)
[![Code Climate](https://codeclimate.com/github/chanhpark/vent.it/badges/gpa.svg)](https://codeclimate.com/github/chanhpark/vent.it)
[![Coverage Status](https://coveralls.io/repos/chanhpark/vent.it/badge.png?branch=master)](https://coveralls.io/r/chanhpark/vent.it?branch=master)

Vent.it is an App where people can come and vent and get things off their chest. It was my Breakable Toy for the last week of Launch Academy.

Give Vent.it a try at : http://ventit.herokuapp.com

Here are some screenshots of Vent.it

Home Page
![alt tag](home.png)
D3 Visualization
![alt tag](data.png)
Admin Page
![alt tag](admin.png)

You can also try this locally on your machine.

```
git clone git@github.com:chanhpark/vent.it.git
rake db:create
rake db:migrate
rake db:seed (for categories)
```
You will have a blank database so you can go ahead and get people venting!

**Features**
- people are allowed to vent without signing in
- inorder to comment on a vent or like/dislike a vent user must be signed in
- word counter when a vent gets posted
- d3 visualization used with the word counter
- admin panel to have the admin delete/edit any vents
- users can search for specific vents
- there are 5 random vents that populate on the index page as it refreshes
- categories to see only certain topics

In case you didnt want to go through all my commit history: Below is a day breakdown of my work done with features to come and what I can improve.

![alt tag](er.png)

**Jan 10th, 2015**
  - The initial commit
  - started the rails app and added travis, coveralls, badges to start with testing.
  - Added some test features
  - Added CRUD functionality for Vents
  - Added CRUD Functionality for Comments on a Vent.

**Jan 11th, 2015**
  - Added an Admin role to the users table
  - Added test for being able to edit and delete comments
  - Admin is able to edit/delete Vents
  - cleaned up unncessary code

**Jan 12th, 2015**
  - Added Categories Table with association to Vents
  - Added functionality to choosing a Category when a Vent is posted
  - Added a Random Vent to populate on the index page

**Jan 13th, 2015**
  - Added test to show the categories on the Vent
  - Styling for forms and signup/signin
  - Fixed the random post for the show page
  - Added Pagination to the index page
  - added styling o the navigation bar and pagination
  - Refactored code

**Jan 14th, 2015**
  - 5 random vents > 1 random vent
  - acts_as_votable gem to add voting capabilities
  - Added search feature to find Vents with that content
  - Added Test functionality for search and voting
  - Styling of how the page looks

**Jan 15th, 2015**
  - deployed to Heroku
  - trying to add a word counter so that when vents posts it gets added to a table
  - would like to have a visualization of the content and what words people say
    depending on what they talk about

**Jan 16th, 2015**
  - add the tables Words, WordCounts, with their relationships
  - refactored the word counting methods
  - When a vents get posted the content gets counted and added to Word_Counts Table.
  -
**Jan 17th, 2015**
  - A list of words and their counts show up on the words/index page.
  - Added Footer and styling to all the pages

**Jan 18th, 2015**
   - Changed up the styling for the whole application.
   - fixed search bar
   - fixed failing test for the word counter

**Jan 19th, 2015**
   - Added unit tests for my models.
   - got a sample visual of d3 working to see the type of hash needed to push through as the root
   - changed the show page for comments

**Jan 20th, 2015**
   - took out serializer and decided to use Jbuilder instead
   - got d3 beautifulbubbles through D3 to show on page
   - changed word column type from text to string in the Words Table

**Jan 21st, 2015**
   - Added styling to the application

**Jan 22nd, 2015**
   - checked for w3c html markup validations
   - added partials to code
   - changed node colors

**Jan 23rd, 2015**
   - refactored code
   - banner is responsive
   - truncated user email on nav

**Jan 31st, 2015**
  - implemented google analytics to see how many people go from vent.it to side projet creative.ity
   
**Things to do:**
- optimize the json reader with D3 so load time of visualization is faster
- style the application more
- Ajax to update the votes rather than refreshing the whole page
- add twitter authentication - so people can be able to vent the tweet straight to their twitter page

