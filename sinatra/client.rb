require 'rubygems'
require 'sinatra/base'

class SigimeraApiClient < Sinatra::Base
    configure :production do
        # TODO: Add here configuration entries if needed
    end

    set :public_folder, File.dirname(__FILE__) + '/static'

    get '/' do
        erb :index
    end
end
