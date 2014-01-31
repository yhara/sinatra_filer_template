require 'sinatra'
require 'sinatra/reloader'
require 'slim'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  DEFAULT_DIR = File.expand_path("~")

  get '/' do
    dir = params[:path] || DEFAULT_DIR
    @dirs, @files = Dir.entries(dir).map{|name|
      [name, File.expand_path(name, dir)]
    }.partition{|name, full|
      File.directory?(full)
    }

    slim :index
  end

  def h(str)
    Rack::Utils.escape(str)
  end
end