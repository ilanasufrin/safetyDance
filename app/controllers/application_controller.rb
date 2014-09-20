class ApplicationController < Sinatra::Base
  helpers Sinatra::Cookies

  configure do
    register Sinatra::Namespace
  end

  configure :development do
    register Sinatra::Reloader
  end

end
