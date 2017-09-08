# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product
!["Main page of Jungle where users can see all products"](https://github.com/johnwonghw/jungle-rails/blob/master/docs/Screen%20Shot%202017-09-07%20at%206.58.07%20PM.png?raw=true)
!["Checkout where the Stripe API is integrated"](https://github.com/johnwonghw/jungle-rails/blob/master/docs/Screen%20Shot%202017-09-07%20at%206.59.14%20PM.png?raw=true)
!["Proudct editing page where admins can add or delete products"](https://github.com/johnwonghw/jungle-rails/blob/master/docs/Screen%20Shot%202017-09-07%20at%207.01.13%20PM.png?raw=true)

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
