class User < ApplicationRecord
  has_many :events, 		 :foreign_key => :creator_id
  has_many :attended_events, :through     => :event_attendees
  has_many :event_attendees, :foreign_key => :attendee_id

  def previous_events
  	self.attended_events.past
  end

  def upcoming_events
  	self.attended_events.upcoming
  end
  
end
