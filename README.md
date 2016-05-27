# tufte_blog

## Getting started

You need'll [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io/).

    mkdir blog/
    cd blog/
    echo 'source "https://rubygems.org"\n\ngem "blag", "~> 1.0"' > Gemfile
    bundle install
    bundle binstubs blag
    bin/blag init
    bin/blag build
    bin/blag serve
    git init
    git commit -am 'Initial commit'
    curl -u 'yourname' https://api.github.com/user/repos \
      -d '{"name":"yourname.github.io"}'
    git remote add origin git@github.com:yourname/yourname.github.io.git
    git push origin master

