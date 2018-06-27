# Match me, baby!
[![N|Solid](https://s33.postimg.cc/g2wlsyhmn/ruby-on-rails-development.jpg)](https://rubyonrails.org/)

Remember those sweet times, looking at your soon-to-be partner with longing eyes, devising the best way to approach him/her and make him/her fall in love with yo forever? Well DON'T! Seriously, there's no need. 

**Who needs love when we have algorithms?**

# Objective

The goal here is to create a match making websites using **Ruby on Rails** and some gems (complete list [here](#gems))

## Features to implement

---------
## Authentication
- [ ] A user can sign up using at least:
    - a mail address, 
    - a username, 
    - a surname, 
    - a first name, 
    - and a secure password
- [ ] A user can login using his username and password
- [ ] A user can receive a password reset mail if forgotten
- [ ] A user can logout from ANY page
- [ ] The authentication should use Oauth (from the intranet)
---------
## Website administration
- [ ] A full rights (or roles/permissions) system for users and admins
- [ ] Only one table in the database for user/admin
---------
## Logged user profile
Once logged in, a user can edit his website profile, and add information such as:
- [ ] Gender
- [ ] Sexual orientation (bisexual is the default choice)
- [ ] A short presentation
- [ ] A list of interests, in the form of ***reusable*** tags
- [ ] Upload pictures (jpg, png or gif), maximum 5, and one can be used as a profile picture
- [ ] Upload videos (webv or mp4)
- [ ] The user can edit these informations at any time, as well as first name, surname and email address
- [ ] The user can see who consulted his profile and who liked his account
- [ ] The user has a public popularity score (freely defined)
---------
## Geolocation
- [ ] The user can be geolocated to the nearest district
- [ ] The user can be geolocated even if he hasn't explicetely agreed
- [ ] The user can manually edit his location on his profile
---------
## User experience
### Matching list
- [ ] The User can easily access a list of matching profiles (using the matching algorithm)
- [ ] Only interesting matches should be shown (only men for a heterosexual woman).
- [ ] The list should display matches intelligently:
    - in priority users from the same location,
    - with a maximum of shared interests,
    - with high popularity ratings
- [ ] The list should be sortable by:
    - age,
    - location,
    - popularity rating,
    - number of common interests (tags)
- [ ] The user can add filters to the list:
    - age range,
    - popularity range,
    - location 
    - ***optionnal*** distance range,
    - select interest (tags)
### Non-logged user profiles (through logged user)
- [ ] See other people's profiles except for email address and password(??)
- [ ] The profile visit should stay in the history of the logged user
- [ ] Possibility to like a user ONLY if there is at least one picture
- [ ] Ability to unlike if liked
- [ ] See the popularity rating
- [ ] See if the visited user has liked the logged user
- [ ] See if the user is online
- [ ] A **websocket** chat available for two matched profiles if user is online
- [ ] Ability to report a user as ***fake***
- [ ] Ability to block a user. A blocked user:
    - should not appear in searches,
    - should not generate notifications/pop-ups
### Websocket chat
- [ ] Ability to chat online in real time if both users are logged and connected (mutual likes)
- [ ] ***optionnal*** Add a way for the chat to store messages offline with an historic to allow for asynchronous conversations
- [ ] Notifications for any page of the website if there is a new unreaad message
### Notifications
- [ ] A user should be notified in real time (10 seconds delay) for some events.
- [ ] A user can see unread notifications from any page of the website
- [ ] Notifications should be stored offline to display when a user logs back
- [ ] Notifications should display in block 9using a bullet list when clicking button
- [ ] Notification should briefly flahs when the user is logged
- [ ] Profile has been liked by a user
- [ ] Profile connected to another user (mutual like)
- [ ] Profile has been un-liked by a user
- [ ] Profile has been un-liked by a connected user (mutual like)
- [ ] Profile has been visited by a user
- [ ] User has received a message
---------
## Matching algortihm
- [ ] The matching algorithm should take in account
    - Sexual orientation,
    - Geolocation
    - Number of commun interests (tags)
    - Popularity rating
- [ ] The matching algorithm should be written in SQL. Active Record is NOT authorized for this feature.
---------
## Search engine
- [ ] A user search users by selecting criteria such as:
    - age range,
    - location,
    - popularity rating range,
    - number of common interests (tags)
- [ ] The search results should be sortable by:
    - age,
    - location,
    - popularity rating,
    - number of common interests (tags)
- [ ] The user can add filters to the search results:
    - age range,
    - popularity range,
    - location,
    - ***optionnal*** distance range,
    - select interest (tags)
---------

# Bonii ideas
- [ ] Load pictures from Facebook/Google+
- [ ] Interactive user map (using geolocation)
- [ ] distance range in the search/match list filters
- [ ] store chat message with a history when other user is offline to allow asynchronous chat and act as a messaging system
---------

## Gems
- [better_errors]
- [bourbon]
- [cancancan]
- [carrierwave]
- [carrierwave-backgrounder]
- [devise]
- [friendly_id]
- [haml-rails]
- [inherited_resources]
- [kaminari]
- [marvin]
- [paranoia]
- [pg]
- [ransack]
- [redis]
- [sidekiq]
- [simple_form]
- [streamio-ffmpeg]
- [twitter-bootstrap-rails]