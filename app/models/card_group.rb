class CardGroup < ActiveRecord::Base
  set_table_name :card_group
  
  # join table
  belongs_to :access_group
  belongs_to :card
end
