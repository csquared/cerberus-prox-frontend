class Card < ActiveRecord::Base
  set_table_name :card
  set_primary_key :card_id

  #belongs_to :access_group
  
  ['after_hours', 'magic', 'disabled'].each do |field|
    class_eval %{
      def #{field}
        self['#{field}'] == 'Y'
      end
    }
  end
end
