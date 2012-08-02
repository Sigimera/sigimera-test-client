require 'rubygems'
require 'sinatra/base'

require 'json'
require 'open-uri'

class SigimeraApiClient < Sinatra::Base
    configure do
        set :auth_token, ENV['AUTH_TOKEN']
    end

    set :public_folder, File.dirname(__FILE__) + '/static'

    get '/' do
        erb :index
    end

    get '/red_alerts' do
        @crises = JSON(get_crises(1, nil, 'red'))
        erb :red_alerts
    end

    private
    def get_crises(page = 1, type = nil, alert_level = nil)
        url = "http://www.sigimera.org/api/v1/crises?auth_token=#{settings.auth_token}&page=#{page}"
        unless type.nil?
            url += "&type=#{type}"
        end

        unless type.nil?
            url += "&type=#{type}"
        end

        unless alert_level.nil?
            url += "&level=#{alert_level}"
        end

        crises_endpoint = open(url)
        crises = crises_endpoint.read
        crises_endpoint.close
        crises
    end

end
