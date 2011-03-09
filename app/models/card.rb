class Card < ActiveRecord::Base
  set_table_name :card
  set_primary_key :card_id
  validates_presence_of :card_id, :message => "ID can't be blank"

  has_many :card_groups
  has_many :access_groups, :through => :card_groups  

  ['after_hours', 'magic', 'disabled'].each do |field|
    class_eval %{
      def #{field}
        self['#{field}'] == 'Y'
      end
    }
  end
end
