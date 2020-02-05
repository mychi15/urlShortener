module ApplicationHelper
  Rails.env.development? ? 'localhost:3000' : 'shorttyurl.herokuapp.com/'
end
