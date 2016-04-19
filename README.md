## Planeswalkr

[![Planeswalkr Tests][planeswalkr-ci-image]][planeswalkr-ci]

A Magic the Gathering deck building and card trading platform.

[planeswalkr-ci]: https://travis-ci.org/TIY-ATL-ROR-2016-Feb/planeswalkr
[planeswalkr-ci-image]: https://travis-ci.org/TIY-ATL-ROR-2016-Feb/planeswalkr.svg

## Setup

Obviously, you'll want to `git clone` this project in your projects folder, `bundle`,
create a database  `createdb databasename`, and run migrations
with `rake db:migrate` as with any other Rails project.

Then create a new User via `rails c` complete with admin privileges.
For example, `u = User.create(full_name: "Britton Butler", email: "brit@lies.com", password: "cookies", admin: true)`

Afterwards you should make sure to load any desired card set data from
[MtG JSON][mtg-sets]. You're on your own for a source of card images,
unfortunately. Note not the zipped folder but the actual set link saved somewhere, ie. desktop.

[mtg-sets]: http://mtgjson.com/sets.html
