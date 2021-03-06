require 'mail'

module RoundScrapper
  module Mailer
    Mail.defaults do
      delivery_method :smtp, { 
        :address              => "smtp.mandrillapp.com",
        :port                 => 587,
        :user_name            => ENV['MANDRILL_USERNAME'],
        :password             => ENV['MANDRILL_APIKEY'],
        :authentication       => 'plain',
        :enable_starttls_auto => true
      }
    end

    def self.send_notification(content)
      Mail.new do
        from 'round.tracker@heroku.com'
        to 'danielgomezsierra@gmail.com'
        subject 'There was a new draw!!!'
        body content
      end.deliver
    end
  end
end