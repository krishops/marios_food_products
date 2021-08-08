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

## Project Testing

Within the root directory, run the command `docker-compose run web bundle exec rspec` to run the rspec tests of the project.
Testing should output:
**14 examples, 0 failures**  

## Known Bugs

There are no known bugs for the application.

## License

[MIT](https://opensource.org/licenses/MIT)

Copyright (c) Kristen Hopper

## Contact Information

hopperdavis@gmail.com


