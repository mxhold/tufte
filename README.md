# tufte

[![Gem
Version](https://badge.fury.io/rb/tufte.svg)](https://badge.fury.io/rb/tufte)
[![Build Status](https://travis-ci.org/mxhold/tufte.svg?branch=master)](https://travis-ci.org/mxhold/tufte)
[![Code
Climate](https://codeclimate.com/github/mxhold/tufte/badges/gpa.svg)](https://codeclimate.com/github/mxhold/tufte)
[![Test
Coverage](https://codeclimate.com/github/mxhold/tufte/badges/coverage.svg)](https://codeclimate.com/github/mxhold/tufte/coverage)
[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

tufte is a minimal static site generator ideal for getting a blog running
quickly with:

  - [tufte-css](https://github.com/edwardtufte/tufte-css) for style
  - [redcarpet](https://github.com/vmg/redcarpet) for Markdown rendering
  - [rouge](https://github.com/jneen/rouge) for syntax highlighting

**Note:** this library is an [unmaintained](http://unmaintained.tech/) experiment. If you want an actual static site generator, I would recommend [Jekyll](https://jekyllrb.com/).

## Getting started

You'll need [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io/)
installed first.

Make a new directory for your blog and `cd` to it:

    mkdir blog/
    cd blog/

Add a `Gemfile` for the current version of tufte (make sure to commit this along
with your `Gemfile.lock` for reproducable builds).

    echo 'source "https://rubygems.org"\n\ngem "tufte", "~> 1.0"' > Gemfile
    bundle install

Add binstubs so you don't have to prefix commands with `bundle exec`:

    bundle binstubs tufte

Initialize a new blog and create scaffold files in the current directory:

    bin/tufte init

Generate HTML pages from the templates:

    bin/tufte build

Run a local server to view your blog at <http://localhost:9292> (this is a
simple wrapper around `rackup` so you can pass any options you normally use for
[Rack](https://github.com/rack/rack) such as `-p 4000` to run on port 4000):

    bin/tufte serve

At this point you can edit the files in `templates/` and `posts/` to your
liking, running `bin/tufte build` after each change until you are satisfied with
your new blog.
