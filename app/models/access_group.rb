class AccessGroup < ActiveRecord::Base
  set_table_name :access_group
  validates_presence_of :name

  has_many :door_accesses
  has_many :doors, :through => :door_accesses
end
