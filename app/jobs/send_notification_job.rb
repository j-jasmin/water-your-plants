class SendNotificationJob < ApplicationJob
  require 'twilio-ruby'
  queue_as :default

  def perform
    account_sid = "AC877cd3729453ca81158e68ffa9861d28" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "4f27c9fcf414f37c06f76235ddacaff7" # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
      from: 'whatsapp:+14155238886',
      body: 'Hello there!',
      to: 'whatsapp:+4917665938488'
    )

    puts message.sid
  end
end
