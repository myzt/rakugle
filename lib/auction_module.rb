require 'net/http'
require 'uri'
require 'json'

module Auction

  def initialize(appid, afid)
    @application_id = appid
    @affiliate_id = afid
  end

  def create_uri(parameters)
    endpoint = 'https://app.rakuten.co.jp/services/api/AuctionItem/Search/20130905?'

    param_string = (parameters.collect {|k, v| "#{k}=#{v.encode("UTF-8")}"} ).join('&')
    uri = URI.parse( endpoint + param_string)
    return uri
  end

  def get_result(parameters)
    uri = create_uri(parameters)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    items = result["Items"]
    return items
  end

  def search_keyword(key)
    parameters = {
      :applicationId => @application_id,
      :keyword => URI.escape(key)
    }
    items =  get_result(parameters)
    return items
  end

  module_function :initialize
  module_function :create_uri
  module_function :get_result
  module_function :search_keyword
end
