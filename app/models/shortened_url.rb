class ShortenedUrl < ApplicationRecord
  validates :long_url , presence: true

  default_scope -> { order(created_at: :desc) }
  paginates_per 5

  def self.generate_token
    loop do
      new_token = SecureRandom.hex(3)
      return new_token unless ShortenedUrl.exists?(token: new_token)
    end
  end
end
