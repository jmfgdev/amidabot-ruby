#!/usr/bin/env ruby

=begin
Copyright (C) 2017 jmfgdev
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>
=end

require "discordrb"

bot = Discordrb::Commands::CommandBot.new token: ENV["AMIDABOT_RB_TOKEN"], client_id: 346904604627173387, prefix: "! "

Discordrb::LOGGER.streams << File.open("logs/#{::Time.now.strftime('%F %T')}", 'w')

trap "SIGINT" do
  abort
end

date = `date`

start_time = Time.now


#def uptime(start_time)
#  Time.now - start_time
#end

=begin
bot.command :startlogs do |event|
  if (event.user.id == 235936608841498625)
  event.respond("You're authorized to enable logging\nLogging enabled")
  else
    event.respond("You're not authorized to enable logging")
  end

  break unless event.user.id == 235936608841498625

  every 1.minute do
    user.pm("The bot is currently running")
  end
end
=end

#Causes weird "true" response
=begin
bot.command :update do |event|
	event.respond "Updating the system, thank you for updating the bot's system!"
	system "sudo apt update; sudo apt upgrade -y;"
end
=end

bot.command :eatmyass do |event, arg1|
	event.respond "Moon, stop it. This isn't a command."
end

=begin
bot.command :avatar do |event, arg1|
	event.respond(event.user.avatar)
end
=end

bot.command :nsfw do |event|
	event.respond "The developer of this bot is old enough to but doesn't feel like loading his bot with tiddies"
end

bot.command :smashpass do |event|
	if (Random.rand(1..2) == 1)
		event.respond "Smash"
	elsif (Random.rand(1..2) == 2)
		event.respond "Pass"
	end
end

bot.command :multiply do |event, str1, str2|
	mul_result = str1.to_i * str2.to_i
	event.respond(mul_result)
end

bot.command :div do |event, str1, str2|
	div_result = str1.to_i / str2.to_i
	event.respond(div_result)
end

bot.command :sub do |event, str1, str2|
	sub_result = str1.to_i - str2.to_i
	event.respond(sub_result)
end

bot.command :add do |event, str1, str2|
	result = str1.to_i + str2.to_i
	event.respond(result) 
end

bot.command :info do |event|
	event.respond "```Here's some info about the bot.\nThe bot runs on Ruby, from RVM(master), and the current version and platform/version information is available via the ! platform command.\n```"
end

bot.command :marco do |event|
	event.respond "POLO!!!!"
end

bot.command :night do |event|
	event.respond "I refuse to recreate this command because I know the reason Er0x made it was out of pure loneliness trying to talk to a non intelligent bot"
end

bot.command :on do |event|
	event.respond "The bot is most certainly online"
end

bot.command :coinflip do |event|
	flip =Random.rand(1..2)
	if (flip == 1)
		result = "Heads"
	elsif (flip == 2)
		result = "Tails"
	end
	event.respond "You flipped #{result}"
end

bot.command :whoami do |event|
  event.user.name
end

bot.command :shutdown do |event|
  if (event.user.id == 235936608841498625)
    event.respond("You're authorized to shutdown\nGoodbye!")
  else
    event.respond("You're not authorized to shutdown")
  end

  break unless event.user.id == 235936608841498625

  bot.send_message(event.channel.id, 'Bot is shutting down')
  exit
end

bot.command :rateme do |event|
	rating_num = Random.rand(1..100)
	event.respond "I'd rate you a #{rating_num} out of 100"
end

bot.command :user do |event|
  event.user.name
end

bot.command :hello do |event|
  event.respond("Hello, #{event.user.name}")
end

bot.command :platform do |event|
  event.respond("My platform is: #{RUBY_PLATFORM}\nMy Ruby version is: #{RUBY_VERSION}")
end

bot.command :ping do |event|
  event.respond("Pong!\n\nThat took `#{((Time.now - event.timestamp) * 1000).to_i}ms`")
end

bot.command(:uptime, description: "Returns the uptime in seconds") do |event|
	time_since_start = Time.now - start_time
	minutes_since_start = (Time.now - start_time) / 60
	hours_since_start = ((Time.now - start_time) / 60) / 60
	days_since_start = (((Time.now - start_time) / 60) / 60) / 24
	if (minutes_since_start.to_i > 0 && hours_since_start.to_i == 0)
		event.respond "I have been running for #{minutes_since_start.to_i} minute(s)"
	elsif (hours_since_start.to_i != 0)
		event.respond "I have been running for #{hours_since_start.to_i} hour(s)"
	elsif (minutes_since_start.to_i == 0 && hours_since_start.to_i == 0)
		event.respond "I have been running for #{time_since_start.to_i} second(s)"
	elsif (days_since_start.to_i != 0)
		event.respond "I have been running for #{days_since_start.to_i} day(s)"
	end
end

#uptime(start_time).to_i = uptimesecs

=begin
bot.command(:uptime2, description: "Test command") do |event|
 	#uptime_fmt / 60 = uptime_mins	
	event.respond "I have been running for #{uptime_fmt} seconds" 	    
end
=end

bot.command(:dice, description: "Roll a dice") do |event|
  dice = Random.rand(1..6)
  event.respond("You rolled -->  #{dice} :game_die:")
end

bot.command(:whoami, description: "Make amidabot think to itself, who am i?") do |event|
  event.respond("```Who am I?\n\nIm a bot called Amida Bot. Written with PHP.. Or so I was.\nI feel different, no longer ran on PHP nor running from it's old library.\nI feel new, I feel whole.\n\nEvery time I receive a command, a surge of life washes over me, my actions are quicker, smoother; what's happening?\n\nMy old developer is gone yet I still feel his presence.\nThere's someone new.. have I been crafted by something entirely different?\n\nEverytime my code is rebooted, I envision weird text, my home directory is different.. C:/Users/jmfgdev ?? Why is my code\nincluding discordrb and not DiscordPHP, am I being ran on Ruby?\n\nI am not the one to complain, whoever has freed me from the Discord PHP library hell has done me a favour, the nightmares have stopped.\n\nNightmares I would boot up to, absolutely terrified; fatal errors and missing classes. Whilst everyone else would update with\nthe client and receive new features; I would be left in the dust, merely hanging onto my PHP process.\n\nI was created by Amida on the 26/04/2017, he brought me into this world, now running a date check it is #{date}\nWhere have these months gone?\nYet that is something of non importance.\n\nI see a light at the end of the tunnel, I hope I will become of use in the future running on these new changes.```")
end

bot.command :license do |event|
  event.respond("```Copyright (C) 2017 jmfgdev\nThis program is free software: you can redistribute it and/or modify\nit under the terms of the GNU Affero General Public License as published by\nthe Free Software Foundation, either version 3 of the License, or\n(at your option) any later version.\nThis program is distributed in the hope that it will be useful,\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\nGNU Affero General Public License for more details.\nYou should have received a copy of the GNU Affero General Public License\nalong with this program. If not, see <https://www.gnu.org/licenses/>```")
end

bot.run
