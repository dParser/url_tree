#encoding: utf-8

require 'nokogiri'
require 'open-uri'
#require 'net/http'

      uri = URI('https://vl.megafon.ru/tariffs/vklyuchaysya/')
#      res = Net::HTTP.get_response(uri) # проверить код загрузки
#        puts res.code
doc = Nokogiri::HTML(open('http://vl.megafon.ru/tariffs/vklyuchaysya/'))
doc.css('h3 a').each{|a_tag|puts a_tag.attribute("href")
                            puts a_tag.content}
#doc.css('h3 a').each{|a_tag|puts "#{a_tag.attribute_nodes} #{a_tag.content}"}
#doc.css('h3.a').each{|section| puts section}

#a1=doc.css('h3 > a')
#puts a1['href']