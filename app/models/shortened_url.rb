class ShortenedUrl < ApplicationRecord
  validates :long_url , presence: true

  def self.create_short_url(long_url)
    "https://#{ShortenedUrl.random_code}"
  end

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(6)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end
end
