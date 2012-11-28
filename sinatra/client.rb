require 'rubygems'
require 'sinatra/base'

require 'json'

require 'sigimera'

class SigimeraApiClient < Sinatra::Base
    configure do
        set :auth_token, ENV['AUTH_TOKEN']
    end

    set :public_folder, File.dirname(__FILE__) + '/static'

    get '/' do
        erb :index
    end

    get '/crises_list' do
        @crises = get_crises(1, params[:type], params[:level])
        erb :crises_list
    end

    private
    def get_crises(page = 1, type = nil, alert_level = nil)
        client = Sigimera::Client.new settings.auth_token

        query = Hash.new
        query['type'] = type if type
        query['level'] = alert_level if alert_level

        client.get_latest_crises query
    end

end
