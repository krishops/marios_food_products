# Mario's Foods

#### By Kristen Hopper

## Technologies Used

* _Ruby_
* _Rails_
* _HTML_
* _ActiveRecord_
* _Docker_

## Description

This website lists products sold by Mario's Foods. Each product displays the price and country. Customers can also leave a review for the products.

## Setup/Installation Requirements

To use this project, you will first need to install [Docker](https://docs.docker.com/get-docker/). Once it is installed, run `docker pull ruby:2.6.5` in the terminal to pull and install the correct image of Ruby on your machine.

You can now clone the project by running `git clone https://github.com/krishops/marios_food_products` in the terminal.

Within the root directory of the project, run `docker-compose up --build` in the terminal to build the project. This will also start a local server that can be accessed in the browser at localhost:3000. 

Ctrl-C out of the server and run the following commands:

`docker-compose run web bundle exec rails generate rspec:install`
      
      Type 'n' when prompted to keep the project's updated spec helper files.

`docker-compose run web bundle exec rake db:create`

`docker-compose run web bundle exec rake db:migrate`

`docker-compose run web bundle exec rake db:test:prepare`

`docker-compose run web bundle exec rake db:seed`

You can now restart the server at localhost:3000 by running `docker-compose up`. The site will automatically display 50 products, each with 5 reviews.

Admin permissions for the site can be set within the rails console. In the terminal run `docker-compose run web bundle exec rails dbconsole` and enter the password "password" when prompted. This will start the SQL database.

```
SELECT * FROM users;
  // displays users table to determine id for desired admin account
UPDATE users SET admin = 't' WHERE id = [USER_ID];
  // replacing [USER_ID] with user's id
```

## Project Testing

Within the root directory, run the command `docker-compose run web bundle exec rspec` to run the rspec tests of the project.
Testing should output: **22 examples, 2 failures**

The delete pages integration specs use two different options for handling confirmation pop-ups, unfortunately neither 'accept' modals or 'window' handlers are supported by the Selenium driver. Other working testing methods are still being researched by project owner.

## Known Bugs

Bug in routing: When landing page successfully accesses products page, a user is unable to add a new product.

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) Kristen Hopper

## Contact Information

hopperdavis@gmail.com


