class ToppagesController < ApplicationController
  def index
    base_url = 'https://tech-kids-api.herokuapp.com'
    connection = Faraday.new(url: base_url) do |builder|
      builder.request  :url_encoded
      builder.response :logger
      builder.response :json, parser_options: { symbolize_names: true }
      builder.adapter Faraday.default_adapter
    end
    @areas = (connection.get '/api/v1/areas').body[:data]
    @prefectures = connection.get '/api/v1/prefectures'
  end
end