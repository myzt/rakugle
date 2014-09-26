require 'ichiba_module'
require 'books_module'

class IndexController < ApplicationController

  def index
    if not params[:keyword].empty? then
      @keyword = params[:keyword]

      Ichiba::initialize(ENV["APPID"], ENV["AFID"])
      @ichiba_items = Ichiba::search_keyword(@keyword)

      Books::initialize(ENV["APPID"], ENV["AFID"])
      @books_items = Books::search_keyword(@keyword)
    end
  end

end
