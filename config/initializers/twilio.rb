Twilio.configure do |config|
  config.account_sid = ENV['S3_BUCKET']
  config.auth_token = ""
end
