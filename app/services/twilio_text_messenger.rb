class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV['PHONE_NUMBER'],
      to: '+12024454456',
      body: message
      })
  end
end
