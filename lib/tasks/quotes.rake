namespace :quotes do
  desc 'Scrape quotes from quotes website'
  task scrape_quotes: :environment do
    QuoteScraper.scrape_quotes
  end
end
