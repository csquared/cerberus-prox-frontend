class AccessLog < ActiveRecord::Base
  set_table_name :access_log

  scope :all_last_denied, lambda { |time| 
    {:conditions => ["action = :action AND (logged > :capture_time)", 
                    {:action => "DENY", :capture_time => time}], 
    :order => "logged DESC", :limit => 1}
  }
  
  def self.last_denied(time)
    self.all_last_denied(time).first
  end
end
