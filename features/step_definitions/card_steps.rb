Given /^there are cards with the following data:$/ do |table|
  table.hashes.each do |hash|
    c = Card.new(
      hash.merge(
        :after_hours => "Y", 
        :expires => Time.now + 1.year,
        :magic => "N",
        :disabled => "N",
        :valid_from => Time.now - 1.year
      )
    ) 
    c.card_id = hash['card_id']
    c.save!
  end
end

