time_now = Time.now
#Time.new is synonym

puts time_now

# Components of a Time
fraction_1 = "Current Time : " + time_now.inspect
fraction_2 = time_now.year    # => Year of the date 
fraction_3 = time_now.month   # => Month of the date (1 to 12)
fraction_4 = time_now.day     # => Day of the date (1 to 31 )
fraction_5 = time_now.wday    # => 0: Day of week: 0 is Sunday
fraction_6 = time_now.yday    # => 365: Day of year
fraction_7 = time_now.hour    # => 23: 24-hour clock
fraction_8 = time_now.min     # => 59
fraction_9 = time_now.sec     # => 59
fraction_10 = time_now.usec   # => 999999: microseconds
fraction_11 = time_now.zone   # => "UTC": timezone name

#Formatting

format_1 = time_now.to_s
format_2 = time_now.ctime
format_3 = time_now.localtime
format_4 = time_now.strftime("%Y-%m-%d %H:%M:%S")

#Formats I like

puts format_date = time_now.strftime("%d-%m-%Y")
puts format_time = time_now.strftime("%H:%M")
