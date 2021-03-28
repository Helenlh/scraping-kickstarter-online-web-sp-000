require "nokogiri"
require 'pry'

# def get_page 
#   doc = Nokogiri::HTML(open('http://fixtures/kickstarter.html'))
# end 


def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  
kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    
    projects[title.to_sym] = {
      
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
  projects 
end

QUESTIONS:

why don't I need a Project file like I did in the first scraper lab where I had course.rb.

in the first scraper lab, I just had to hover over elements such as title and date, but in this lab I had to click on the element.  Why is this?

in the first lab, I had: 
# def get_page
#   doc = Nokogiri::HTML(open('http://fixtures/kickstarter.html'))
# end 

in this lab, I have:
 html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

does File.read do the same thing as the doc = Nokogiri command?