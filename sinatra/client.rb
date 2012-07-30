require 'rubygems'
require 'sinatra/base'

class SigimeraApiClient < Sinatra::Base
    configure :production do
        # TODO: Add here configuration entries if needed
    end

    get '/' do
        erb :index
    end
end
