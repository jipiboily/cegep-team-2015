class Course
  def initialize
    @attendees = []
  end

  def attendees
    @attendees
  end

  def add_attendee name
    @attendees << name
  end

  def number_of_attendees
    @attendees.size
  end
end
