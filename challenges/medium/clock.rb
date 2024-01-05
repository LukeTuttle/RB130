
=begin
clock does not need to handle being initialized with more > 24 hrs or 1440 minutes (mins in a day)
clock time range is 0..1440 mintues
if time is < 0 subtract the abs value of the distance from zero from 1440
if time is > 1440 take the modulo
adding and subtracting result in new clock object

I need a general method to convert hours 

=end



class Clock
  attr_reader :time
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def self.at(hrs, mins = 0)
    new((MINUTES_PER_HOUR * hrs + mins))
  end

  def initialize(mins)
    @time = normalize_minutes_to_0_through_1439(mins)
  end

  def +(mins)
    new_minutes = normalize_minutes_to_0_through_1439((@time + mins))
    self.class.new(new_minutes)
  end

  def -(mins)
    new_minutes = normalize_minutes_to_0_through_1439((@time - mins))
    self.class.new(new_minutes)
  end

  def to_s
    hours, minutes = @time.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hours, minutes)
  end

  def ==(other)
    @time == other.time
  end

  private

  def normalize_minutes_to_0_through_1439(minutes)
    minutes += MINUTES_PER_DAY while minutes.negative?
    minutes % MINUTES_PER_DAY
  end

  def to_mins(hrs)
    (hrs * MINUTES_PER_HOUR) % MINUTES_PER_DAY
  end
end

# a = (Clock.at(11, 30))
# puts a
# puts '---'
# puts Clock.at(26,30)

# puts a + 30