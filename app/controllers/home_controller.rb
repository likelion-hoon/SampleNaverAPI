require 'net/http'
require 'nokogiri'

class HomeController < ApplicationController
  def index

  end

  def search
    query = params[:query]
    queryUrl = "https://openapi.naver.com/v1/search/local.xml?query="+query

    uri = URI(URI.encode(queryUrl))

    req = Net::HTTP::Get.new(uri)
    req['X-Naver-Client-Id'] = "mqDPQhoKS1QzNJW2JDWo"
    req['X-Naver-Client-Secret'] = "Kli7WUwHHI"

    res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https' ) {|http|
      http.request(req)
    }

    # @ddd = res.body

    xml_doc = Nokogiri::XML(res.body)
    @links = xml_doc.xpath("//title")



  end

end
