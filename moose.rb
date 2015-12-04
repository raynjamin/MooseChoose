require 'nokogiri'
require 'rest-client'
require 'rubygems'
require 'bundler/setup'

Bundler.require

url = "http://us.battle.net/wow/en/character/aerie-peak/#{ARGV[0]}/mount"
page = Nokogiri::HTML(RestClient.get url)

warden = page.at(".//*[@class='name color-q4' and contains(text(), 'Grove Warden') and ancestor::*[@class='grid-item is-collected flying']]")

if warden.nil?
	puts "No moose!".green
else
	puts "Has moose already.".red
end