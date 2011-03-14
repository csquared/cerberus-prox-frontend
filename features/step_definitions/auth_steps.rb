Given /^I am logged in$/ do
end

When /^my card with code "([^"]*)" is denied$/ do |code|
  AccessLog.create!(:action => "DENY", :logged => Time.now, :card_id => code)
end

When /^my card with code "([^"]*)" is denied from the "([^"]*)"$/ do |code, door|
  AccessLog.create!(:action => "DENY", :logged => Time.now, 
    :card_id => code, :door => door)
end

When /^I wait "([^"]*)" seconds$/ do |seconds|
  sleep(seconds.to_i)
end

Given /^there is an Access group called "([^"]*)"$/ do |name|
  AccessGroup.create!(:name => name)
end

Given /^there is a door called "([^"]*)"$/ do |name|
  Door.create!(:name => name)
end
