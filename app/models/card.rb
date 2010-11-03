class Card < ActiveRecord::Base
  set_table_name :card
  set_primary_key :card_id

  belongs_to :access_group
end
