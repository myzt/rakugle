require 'ichiba_module'
require 'books_module'
require 'kobo_module'
require 'auction_module'

class IndexController < ApplicationController

  def index
    if params[:keyword] and not params[:keyword].empty? then
      @keyword = params[:keyword]

      Ichiba::initialize(ENV["APPID"], ENV["AFID"])
      @ichiba_items = Ichiba::search_keyword(@keyword)

      Books::initialize(ENV["APPID"], ENV["AFID"])
      @books_items = Books::search_keyword(@keyword)
      
      Kobo::initialize(ENV["APPID"], ENV["AFID"])
      @kobo_items = Kobo::search_keyword(@keyword)

      Auction::initialize(ENV["APPID"], ENV["AFID"])
      @auction_items = Auction::search_keyword(@keyword)
    end
  end

end
