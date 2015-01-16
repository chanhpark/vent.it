Vent.it
======

[![Build Status](https://travis-ci.org/chanhpark/vent.it.svg)](https://travis-ci.org/chanhpark/vent.it)
[![Code Climate](https://codeclimate.com/github/chanhpark/vent.it/badges/gpa.svg)](https://codeclimate.com/github/chanhpark/vent.it)
[![Coverage Status](https://coveralls.io/repos/chanhpark/vent.it/badge.png?branch=master)](https://coveralls.io/r/chanhpark/vent.it?branch=master)

Jan 10th, 2015
  - The initial commit 
    - started the rails app and added travis, coveralls, badges to start with testing.
    - Added some test features 
    - Added CRUD functionality for Vents
    - Added CRUD Functionality for Comments on a Vent.

Jan 11th, 2015
  - Added an Admin role to the users table
  - Added test for being able to edit and delete comments
  - Admin is able to edit/delete Vents
  - cleaned up unncessary code

Jan 12th, 2015
  - Added Categories Table with association to Vents
  - Added functionality to choosing a Category when a Vent is posted
  - Added a Random Vent to populate on the index page

Jan 13th, 2015
  - Added test to show the categories on the Vent
  - Styling for forms and signup/signin
  - Fixed the random post for the show page
  - Added Pagination to the index page
  - added styling o the navigation bar and pagination
  - Refactored code

Jan 14th, 2015
  - 5 random vents > 1 random vent
  - acts_as_votable gem to add voting capabilities
  - Added search feature to find Vents with that content
  - Added Test functionality for search and voting
  - Styling of how the page looks

Jan 15th, 2015
  - deployed to Heroku
  - trying to add a word counter so that when vents posts it gets added to a table
  - would like to have a visualization of the content and what words people say depending on what they talk about
