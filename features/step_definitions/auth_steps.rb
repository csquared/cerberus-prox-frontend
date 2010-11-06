Given /^I am logged in$/ do
end

When /^my card with code "([^"]*)" is denied$/ do |code|
  AccessLog.create!(:action => "DENY", :logged => Time.now, :card_id => code)
end

When /^I wait "([^"]*)" second$/ do |seconds|
  sleep(seconds.to_i)
end

