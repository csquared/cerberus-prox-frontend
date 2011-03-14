module CardsHelper
  def has_access?(access_log)
    doors = @card.access_groups.map(&:doors).flatten.uniq
    doors.map(&:name).include? access_log.door  
  end
end
