require 'open-uri'
require 'kconv'
require 'nokogiri'

namespace :scrape do

  task :scraping => :environment do

  url ='https://lifes-inc.jp/'
  html = open(url) do |f|
           f.read
         end

    doc = Nokogiri::HTML.parse(html,nil,'utf-8')

    doc.css('h2.entry-title').each do |content|
       body = content.to_html
       feed = Feed.new(
         body: body
       )
       feed.save
      end
end

end
