=begin
start 12:16
# Define a class Meetup with a constructor taking a month and a year
# and a method day(weekday, schedule).
# where weekday is one of: monday, tuesday, wednesday, etc.
# and schedule is first, second, third, fourth, fifth, last, or teenth.

method day should return a date object with year month day
dont worry about input spelling of weekday or schedule or month or year

constructor method takes year and month as integers

things to keep in mind:
- April June September and November have 30 days
- Feb has 28 days, 29 if a leap year; 2024 is a leap year
- All other months have 31 days
- the first day of the week of the month (DOWM) happens between the 1st and the 7th
-  The second DOWM is between the 8th and 14th of the month.
- The third DOWM is between the 15th and 21st of the month.
- The fourth DOWM is between the 22nd and 28th of the month.
- The fifth DOWM is between the 29th and 31st of the month.
- The last DOWM is between the 22nd and the 31st of the month depending on the number of days in the month. 
- There is always one day of the week with a date which ends in 'teenth' (13th-19th)
- Not all days will have five occurences during a month, in which case return nil
- 


Determine which range of DOM the day falls within and then search for 
the appropriate day of the week in that range. If it doesn't exist, return nil

Algorithm:
- create a date object which corresponds to the first day in the range corresponding to the schedule
- set out_date to nil
- check each date in the range to see if it is the appropriate DOFW
  - starting with the first day in the range, increment the current date until
    the current date falls on the appropatie DOFW or the range limit is met
    - set out_date to current date and exit loop
  - if range limit is met, exit loop
- return out_date

=end


