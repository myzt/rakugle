require 'ichiba_module'
require 'books_module'

class IndexController < ApplicationController

  def index
    Ichiba::initialize(ENV["APPID"], ENV["AFID"])
    @ichiba_items = Ichiba::search_keyword("鎧")

    Books::initialize(ENV["APPID"], ENV["AFID"])
    @books_items = Books::search_keyword("鎧")
  end

end
