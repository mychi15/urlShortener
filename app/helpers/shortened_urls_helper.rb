module ShortenedUrlsHelper
  def short_url(record)
    "http://#{domain}/#{record.token}"
  end
end
