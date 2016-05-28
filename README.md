# tufte

[![Build Status](https://travis-ci.org/mxhold/tufte.svg?branch=master)](https://travis-ci.org/mxhold/tufte)

tufte is a minimal static site generator ideal for getting a blog running
quickly with:

  - [tufte-css](https://github.com/edwardtufte/tufte-css) for style
  - [redcarpet](https://github.com/vmg/redcarpet) for Markdown rendering
  - [rouge](https://github.com/jneen/rouge) for syntax highlighting

See it in action at <https://maxwellholder.com>.

## Getting started

You'll need [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io/)
installed first.

    mkdir blog/
    cd blog/
    echo 'source "https://rubygems.org"\n\ngem "tufte", "~> 1.0"' > Gemfile
    bundle install
    bundle binstubs tufte
    bin/tufte init
    bin/tufte build
    bin/tufte serve
    git init
    git commit -am 'Initial commit'
    curl -u 'yourname' https://api.github.com/user/repos \
      -d '{"name":"yourname.github.io"}'
    git remote add origin git@github.com:yourname/yourname.github.io.git
    git push origin master

