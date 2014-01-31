# Sinatra Filer Template

Sometimes I want a Sinatra app that can list files in a directory
and traverse file tree with clicking a link.
This repository is a template for such apps.

![](http://gyazo.com/daf7d46fc60bafe185b63dbb15203a95.png)

## Usage

    $ bundle install
    $ rackup
    $ open http://localhost:9292/

Then edit app.rb and index.slim as you like.

## Note

Security warning: I use this template only on localhost or limited 
network, so there is no check about file path
(e.g. `http://localhost:9292/?path=%2Fetc` will just render contents
at `/etc`).

If you will make this app available on the internet, 
you should add a validation on params[:path] like this: 

```ruby
  PUBLIC_ROOT = File.expand_path("~/somewhere")
  ...
  dir = File.expand_path(params[:path]) || PUBLIC_ROOT
  raise unless dir.start_with?(PUBLIC_ROOT)
```

## License

MIT
