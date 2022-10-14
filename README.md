# Budget App
> In the Budget app you can manage your budget by having a list of transactions associated with a category, so that you can see how much money you spent and on what, add a category, and a Transactions page where you can see your payments and add more. 

## 🛠️ Built With

- Ruby on Rails
- RSpec

## 📹 [Video documentation](https://www.loom.com/share/bad9bf27da084db79d06a6c79747943c)
## 💻 [Demo link](https://mikemtzp-budjet.herokuapp.com/)
## 🧮 Prerequisites

### Install
- Node.js
- Yarn
- Ruby
- Ruby on Rails
- Bullet
- Capybara
- Devise
- Cancancan

### Setup

Follow these steps on your console to properly clone this repository on your desktop:

```
$ cd desktop
$ git clone 'repo_path'
$ cd 'repo_name'
$ code .
Run 'ruby file_name' to see outputs in the console.
Run 'rubocop' to check linter offenses.
```

Create database for the project with `bin/rails db:create`, otherwise create databases manually in PostgreSQL.

If necessary, add username and password in `config/database.yml` for development and test:
```
development:
  <<: *default
  database: Budget_app_development
  host: ''
  username:
  password:
  
  test:
  <<: *default
  database: Budget_app_test
  username:
  password:
```

Add the following gems into your `Gemfile` general, development and test groups:
```
gem 'cancancan'
gem 'devise'
gem 'rubocop', '>= 1.0', '< 2.0'
gem 'font-awesome-sass', '~> 6.2.0'
gem 'sassc-rails'
```

```
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "database_cleaner"
  gem 'ffi'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end
```

```
group :development do
  gem "web-console"
  gem 'bullet'
end
```

```
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
```

Install all gems `bundle install`.

#### RSpec

- Set up RSpec in your app and create the Spec folder `rails g rspec:install`.
- Run the migration into your testing environment `rails db:migrate RAILS_ENV=test`.
- _Note: to see all tests with description run `rspec spec --format documentation`._

#### Bullet

- Set up bullet gem by running: `bundle exec rails g bullet:install`.
- Make sure the following snippet is in your `config/environments/development.rb` file:

```
Rails.application.configure do
  config.after_initialize do
    Bullet.enable        = true
    Bullet.alert         = true
    Bullet.bullet_logger = true
    Bullet.console       = true
    Bullet.rails_logger  = true
    Bullet.add_footer    = true
  end
```

#### Cancancan

- Use the provided command to generate a template for your abilities file:
```
rails generate cancan:ability
```

#### Devise

- Run the Devise generator `$ rails generate devise:install`
- Make sure to add the following line of code in your `config/environments/development.rb` file:

```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

- In the following command you will replace `MODEL` with the class name used for the application’s users (it’s frequently `User` but could also be `Admin`). This will create a model (if one does not exist) and configure it with the default Devise modules. The generator also configures your `config/routes.rb` file to point to the Devise controller.

```
$ rails generate devise MODEL
```

- Then run `rails db:migrate`
- _Note: you should restart your application everytime after changing Devise's configuration options._

#### Capybara

- Make sure to add `require "capybara/rspec"` in your `spec/rails_helper` file:

```
ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rspec"
...
end
```

#### Font Awesome

- Rename the file `app/assets/stylesheets/application.css` to `../application.css.scss`.
- Make sure to add `@import "font-awesome";` at the end of your `app/assets/stylesheets/application.css.scss` file.
- _Note: It should be below the `*= require_self` and outside the comment `*/` snippet._

## 👤 Author

### Mike Martínez

- GitHub: [@mikemtzp](https://github.com/mikemtzp)
- Twitter: [@mikemtzp](https://twitter.com/mikemtzp)
- LinkedIn: [Mike Martínez](https://www.linkedin.com/in/mike-mart%C3%ADnez/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to check the [issues page](https://github.com/mikemtzp/Budget_app/issues).

## ⭐️ Show your support

Give a ⭐️ if you like this project!

## 🥇 Acknowledgments

- This project was built based on the original template design idea by [Gregoire Vella](https://www.behance.net/gregoirevella) in [Behance](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=).
- This README.md was elaborated with the [Microverse readme-template](https://github.com/microverseinc/readme-template)

## 📝 License

[MIT License](https://github.com/mikemtzp/Budget_app/blob/dev/LICENSE)
