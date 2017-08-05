# Jungle
Lighthouse Labs - Week 6 Project
An inherited (Amazon clone) e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Project Goals
* Become familiar with Ruby and Rails
* Learn how to navigate an existing code-base.
* Use existing style and approach to implement new features and fix bugs.


## Screenshots
!["Screenshot of Products page"](https://github.com/stevetice/jungle-rails/blob/master/docs/Jungle.PNG?raw=true)
!["Screenshot of Order page"](https://github.com/stevetice/jungle-rails/blob/master/docs/Jungle_Order.PNG?raw=true)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
