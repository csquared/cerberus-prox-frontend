class AccessLog < ActiveRecord::Base
  set_table_name :access_log

  scope :all_last_denied, :conditions => { :action => "DENY" }, :order => "logged DESC", :limit => 1
  
  def last_denied
    all_last_denied.first
  end
end
