# Library

* This project is a library management system developed on Ruby on Rails. It allows for tracking books, borrowers, book
  checkouts and returns, as well as tracking borrower overdue fines.

## Installation

Make sure you have the following installed on your system:

* Ruby
* Ruby on Rails
* Bundler
* PostgreSQL version 15

1. Clone the repository:

```angular2html
git clone https://github.com/TapTapStitch/library_system.git
```

2. Install dependencies using Bundler:

```angular2html
cd cars_management_rails
bundle install
```

3. Create the database:

```angular2html
rails db:create
```

4. Run database migrations:

```angular2html
rails db:migrate
```

5. (Optional) Run seed data to create some sample data:

```angular2html
rails db:seed
```

## Usage

To start the app, run the following command:

```angular2html
rails server
```

Once the server is running, open your web browser and go to http://localhost:3000 to access the app.
