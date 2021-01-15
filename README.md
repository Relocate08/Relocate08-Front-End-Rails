# Relocate: Front-End

## Overview

This repo represents the front-end portion of a three-part project as part of Turing School of Software and Design's Back-End Engineering program, Module 3.  

Titled Relocate, this application aims to ease the chaos of moving, providing a resource for users to discover services in their new hometown.  Upon creating an account, users can search a new hometown by zip code and browse categories of businesses they need such as different utility companies, gyms, parks, and plumbing.  Users can also save favorites to their account to revisit businesses of their choice.  Each business show page displays its phone number, address, and name as well as a link to that business' Yelp page for further information.

All three repositories that make up this project can be found [here](https://github.com/Relocate08).

#### [Visit the Deployed Application Here](https://relocate-front-end-rails.herokuapp.com/)

![Relocate Website Demo](app/assets/images/Relocate_Demo.gif)

## Table of Contents
  - [Design](#design)
  - [Setup](#setup)
  - [Running the Tests](#running-the-tests)
  - [Deployment](#deployment)
  - [Authors](#authors)

### Design
  * The project is split into three repositories, implementing a Service Oriented Architecture for future scalability.  This repository in particular is responsible for the user-facing views along with all services and controllers necessary to query our backend's API.  
  * One database is utilized here on the front-end solely for saving limited user information from Google OAuth to log in a user.

### Setup
#### Prerequisites
These setup instructions are for Mac OS.

This project requires the use of `Ruby 2.5.3` and `Rails 5.2.4.3`.
We also use `PostgreSQL` as our database.

##### Install Necessary Programs

1. Verify your machine has the correct version of Ruby installed (2.5.3).  You can check this by entering `ruby -v` from the command line.
    - To install, enter `rbenv install 2.5.3` from the command line.   

2. Verify your machine has the correct version of Rails installed (5.2.4.3).  You can check this by entering `rails -v` from the command line.
    - To install, enter `gem install rails -v 5.2.3` from the command line.

##### Local Repo Setup
1. Fork & Clone Repo
2. Run `bundle install`.
3. Setup database: `rails db:create`.

##### Google API Registration
1. Register a new app with Google Api Console and give consent.
2. Add a Credential, setting to 'External use' and 'Web Application', and give it a title (eg. 'Oauth Login').  Add the following URI to the redirect/callback field `http://localhost:3000/auth/google_oauth2/callback`.
3. Record the given Client_ID and Client_Secret.

##### Authorizing Application
1. Run `bundle exec figaro install` to set up the `application.yml` file to hide your sensitive credentials.
2. Add your credentials to `application.yml` as environment variables:
```
GOOGLE_CLIENT_ID: <add your client id>
GOOGLE_CLIENT_SECRET: <add your client secret>
RELOCATE_BE_DOMAIN: <add your backend server>
```

#### Running the Tests
From the command line, within the project's directory, run `bundle exec rspec`.  You should see all passing tests.

#### Deployment
To run this project locally, enter `rails server` from the command line and visit `http://localhost:3000` to navigate to the homepage.  It is encouraged to visit this URL in an Incognito window of your browser to prevent needing to periodically delete cookies.

Start up the Back-End and Sinata Microservice as instructed.

### Authors
  - **Christopher Allbritton** - *Turing Student* - [GitHub Profile](https://github.com/Callbritton) - [Turing Alum Profile](https://alumni.turing.io/alumni/christopher-allbritton) - [LinkedIn](https://www.linkedin.com/in/christopher-allbritton)
  - **Dani Coleman** - *Turing Student* - [GitHub Profile](https://github.com/dcoleman21) - [Turing Alum Profile](https://alumni.turing.io/alumni/dani-coleman) - [LinkedIn](https://www.linkedin.com/in/dcoleman-21/)
  - **Kevin Cuadros** - *Turing Student* - [GitHub Profile](https://github.com/kevxo) - [Turing Alum Profile](https://alumni.turing.io/alumni/kevin-david-cuadros) - [LinkedIn](https://www.linkedin.com/in/kevin-cuadros-2bb4551a1/)
  - **Hanna Davis** - *Turing Student* - [GitHub Profile](https://github.com/Oxalisviolacea) - [Turing Alum Profile](https://alumni.turing.io/alumni/hanna-davis) - [LinkedIn](https://www.linkedin.com/in/hanna-davis/)
  - **Hope Gochnour** - *Turing Student* - [GitHub Profile](https://github.com/hopesgit) - [Turing Alum Profile]() - [LinkedIn](https://www.linkedin.com/in/hope-gochnour-3056aa1ba/)
  - **Jake Heft** - *Turing Student* - [GitHub Profile](https://github.com/jakeheft) - [Turing Alum Profile](https://alumni.turing.io/alumni/jake-heft) - [LinkedIn](https://www.linkedin.com/in/jakeheft/)
  - **John Kim** - *Turing Student* - [GitHub Profile](https://github.com/abcdefghijohn) - [Turing Alum Profile](https://alumni.turing.io/alumni/john-kim) - [LinkedIn](https://www.linkedin.com/in/abcdefghijohn/)
  - **Jose Lopez** - *Turing Student* - [GitHub Profile](https://github.com/JoseLopez235) - [Turing Alum Profile](https://alumni.turing.io/alumni/jose-lopez) - [LinkedIn](https://www.linkedin.com/in/jose-lopez-0551a01a1/)
  - **Brett Sherman** - *Turing Student* - [GitHub Profile](https://github.com/BJSherman80) - [Turing Alum Profile](https://alumni.turing.io/alumni/brett-sherman) - [LinkedIn](https://www.linkedin.com/in/brettshermanll/)
  - **Zach Stearns** - *Turing Student* - [GitHub Profile](https://github.com/Stearnzy) - [Turing Alum Profile](https://alumni.turing.io/alumni/zach-stearns) - [LinkedIn](https://www.linkedin.com/in/zach-stearns/)
