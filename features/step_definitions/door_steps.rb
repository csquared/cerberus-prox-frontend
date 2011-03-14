Given /^there is a door called "([^"]*)"$/ do |name|
  Door.create!(:name => name)
end

Given /^I want to open the "([^"]*)"$/ do |door_name|
  Door.should_receive(:post).with('/xml-rpc/', :body => %{<?xml version="1.0"?>
    <methodCall>
       <methodName>DoorControl.openDoor</methodName>
       <params>
          <param>
             <value><string>#{door_name}</string></value>
           </param>
        </params>
    </methodCall>})
end
