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
