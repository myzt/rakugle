require 'cgi'

module Books
  def initialize(appid, afid)
    RakutenWebService.configuration do |c|
      c.application_id = appid
      c.affiliate_id = afid
    end
  end

  def search_keyword(key)
    items = RakutenWebService::Books::Total.search(
                                                   :keyword => key,
                                                   :sort => CGI.escape("sales"),
                                                   :hits => "15"
                                                   )
    return items
  end

  module_function :initialize
  module_function :search_keyword
end
