require 'open-uri'
require 'nokogiri'

class QuoteScraper
  def self.scrape_quotes
    doc = Nokogiri::HTML(URI.open('https://quotes.toscrape.com/'))
    quotes = []
    puts doc.serialize
    doc.xpath('//div[@class="quote"]').each do |quote|
      content = quote.xpath('.//span[@class="text"]')&.text
      puts content
      author = quote.xpath('.//small[@class="author"]')&.text
      puts author
      tags = quote.xpath('.//div[@class="tags"]/a[@class="tag"]/text()').map(&:text).join("\n")
      puts tags
      db_quote = Quote.find_by(content: content, author: author, tags: tags)
      new_quote = Quote.create(content: content, author: author, tags: tags) if db_quote.nil?
      quotes << new_quote
    end
    if quotes.all?(&:nil?)
      Quote.all
    else
      quotes
    end
  end
end
