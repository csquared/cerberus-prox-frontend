class CardGroup < ActiveRecord::Base
  set_table_name :card_group
  
  belongs_to :access_group
end
