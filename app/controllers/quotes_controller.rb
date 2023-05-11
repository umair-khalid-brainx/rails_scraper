class QuotesController < ApplicationController
  def index
    @quotes = QuoteScraper.scrape_quotes
    # @quotes = Quote.all
  end
end
