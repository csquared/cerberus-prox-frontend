When /^(?:|I )visit (.+)$/ do |path|
  visit (path)
end

When /I debug/ do 
  puts "hello"
  debugger
  puts "world"
end
