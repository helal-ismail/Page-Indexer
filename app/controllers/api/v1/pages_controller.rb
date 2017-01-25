require 'open-uri'
class Api::V1::PagesController < ApiController

  api :POST, '/crawl', "Crawl a webpage"
  param :link, String, :desc => "URL of the page to be processed", :required => true
  param :override, [true, false], :desc => "[False if nothing is specified] A flag that indicate either to override the contents in the DB if the page was crawled before", :default => false

  def crawl

    # Check if the page already exists
    page = Page.find_by_link(params[:link])
    render :json => {:data => page } and return if page.present? and !params[:override].present?

    # Override an old page if exists
    page.destroy if page.present?
    page = Page.create(link: params[:link])

    # Process using NOKOGIRI
    doc = Nokogiri::HTML(open(params[:link]))

    # TARGET LIST
    targets = ["h1","h2","h3", "a"]

    # SEARCH FOR EACH TARGET
    targets.each do |target|
      doc.css(target).each do |result|
        #INSERT CONTENT IN DB
        if target == "a"
          Content.create(:target => target, :page_id => page.id, :occurrence => result['href']) if result['href'].include?("http")
        else
          Content.create(:target => target, :page_id => page.id, :occurrence => result.content )
        end
      end
    end

    render :json => page
  end


end
