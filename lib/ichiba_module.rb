module Ichiba
  def initialize(appid, afid)
    RakutenWebService.configuration do |c|
      c.application_id = appid
      c.affiliate_id = afid
    end
  end

  def search_keyword(key)
    items = RakutenWebService::Ichiba::Item.search(:keyword => key)
    return items
  end

  module_function :initialize
  module_function :search_keyword
end
