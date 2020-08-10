# Dottomodachi-back-end Overview

Dottomodachi is a virtual pixel pet game with a javascript front end and a rails api backend.
[Front-End](https://github.com/ReginaF2012/dottomodachi-front-end)

## Installation

Fork and clone this repo then you will need to alter the database.yml.example file to setup your database using postgres. Afterwards run...

    $ rail db:create

Optionally you can seed the database.

    $ rake db:seed

Startup the server

    $ rails s

To see if it's working you can check

    $  localhost:3000

You should see:
<code>
{
"errors": "Please log in"
}
</code>
if things are working correctly.

## Usage

This api is intended to be used with [dottomodachi-front-end](https://github.com/ReginaF2012/dottomodachi-front-end). Once you fork and clone that repo and it is making fetch requests to this server:

- Users can sign up and login
- Users can adopt Dottomodachi
- Dottomodachi go through 2 evolution phases
- Once the dottomodachi has moved away a user can adopt another dottomodachi


## License

[MIT License](https://opensource.org/licenses/MIT).