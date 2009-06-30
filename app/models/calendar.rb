class Calendar
  def initialize(date = Date.today)
    @date = date
  end

  def options
    {:year => @date.year, :month => @date.month, :first_day_of_week => 1}
  end

  def number_of(day)
    if day.class == Date
      day.mday
    else
      day
    end
  end
end
