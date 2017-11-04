Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB-KEY'], ENV['GITHUB-SECRET']
end
