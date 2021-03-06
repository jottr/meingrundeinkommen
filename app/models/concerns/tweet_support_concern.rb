module TweetSupportConcern
  extend ActiveSupport::Concern

  require 'net/http'
  require 'uri'

  included do
    after_save :tweetSupportComment
  end

  def tweetSupportComment
    uri = URI.parse('http://twitter.mein-grundeinkommen.de/tweet')

    if comment && nickname && tweeted.nil?

      text = nickname + ' hat ' + amount_total.round(0).to_s + '€ für das BGE gespendet: ' + comment

      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Post.new(uri.request_uri)
      request.set_form_data('text' => text, 'hashtag' => 'bge', 'url' => 'http://www.mein-grundeinkommen.de')
      request.basic_auth('Q._BhaDr4y8x&vHU', 'aTJ_:x33hbD6P>}t')

      response = http.request(request)

      update_attributes(tweeted: true)

    end
  end
end
