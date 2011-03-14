class DoorAccess < ActiveRecord::Base
  set_table_name :door_access
  
  # join table
  belongs_to :access_group
  belongs_to :door
end
