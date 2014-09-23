class ApplicationController < Sinatra::Base
  helpers Sinatra::Cookies

  configure do
    register Sinatra::ActiveRecordExtension
    register Sinatra::Namespace
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/?' do
    send_file "./public/index.html"
  end

end
