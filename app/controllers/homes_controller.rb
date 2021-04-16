class HomesController < ApplicationController

	def top

	end

	def scrape

        agent = Mechanize.new

  		page = agent.get("https://lifes-inc.jp")

  		@elements= page.search('a')

	end

end
