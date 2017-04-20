module SlackJesusbot
  module Commands
    class Askjesus < SlackRubyBot::Commands::Base
      command 'ping' do |client, data, match|
        client.say(text: 'pong', channel: data.channel)\
      end
      command 'died for my sins' do |client, data, match|
        client.say(text: 'I am the way and the truth and the life. No one comes to the Father except through me (John 14:6). ', channel: data.channel)
      end
      command 'rap' do |client, data, match|
        client.say(text: 'I am beginning to feel like a Rap God, Rap God. All my people from the front to the back nod, back nod .Now, who thinks their arms are long enough. To slap box, slap box? They said I rap like a robot, so call me Rap-bot! A-men.', channel: data.channel)
      end
    end
  end
end
