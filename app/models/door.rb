class Door < ActiveRecord::Base
  set_table_name :door
  validates_presence_of :name

  has_many :door_accesses
  has_many :access_groups, :through => :door_accesses

  before_create :set_default_unlocked

  def set_default_unlocked
    self.default_unlocked ||= 'N'  
  end
end
