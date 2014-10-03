Top Tomato
===========

Overview

This application was built to exercise newly aquired skills in ruby, ruby on rails, and apis. It was done as part of a 2 day sprint modeling agile software development processes. It was a group project that six students worked on.

The goal of the application is to update users via text message with top rated movies from Rotten Tomatos. The text also includes a link to movie times. A webpage is set-up to sign up users and display top movies.

Sample user stories completed were:
- As a guest, I can visit a homepage that links to sign-in and sign-up pages.
- As a user, I can sign-in to my account.
- As a guest, I can sign-up for an account.
- As a user, I should be notified once a week with top movies and local showtimes.

For list of user stories and backlog, see https://www.pivotaltracker.com/s/projects/1179258.

Entity Relationship Diagram

![](http://www.gliffy.com/go/publish/image/6154187/L.png)

Technology used:
- Ruby on Rails 4.1.5.
- PostgreSQL Database
- It uses the Devise gem for log-in.
- Twilio API
- Foundation framework CSS

## Local Setup

Gems needed: figaro, twilio-ruby, whenever, devise

    rake db:create
    rake db:migrate
    rake db:seed
    rails s

Run in the console





