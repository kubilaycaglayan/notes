require 'time'

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
d_m_y = "%d-%m-%Y"

puts format_date = time_now.strftime(d_m_y)
puts format_time = time_now.strftime("%H:%M")

# CREATE your own time
# Time.new(year, month, day, hour, min, sec, time_zone_offset_from_utc)

birthday = Time.new(1991, 04, 15, 1, 12, 59)
puts birthday
age = ((Time.now - birthday) / (60*60*24*365)).round(2)
puts "I am #{age} years old."

# MORE FORMATTING
def give_me_date(n)
    month_names = ["Ocak","Şubat","Mart","Nisan","Mayıs","Haziran","Temmuz","Ağustos","Eylül","Ekim","Kasım","Aralık"]
    day_names = ["Pazartesi","Salı","Çarşamba","Perşembe","Cuma","Cumartesi","Pazar"]
    month_names_short = ["Ock","Şbt","Mrt","Nis","May","Haz","Tem","Ağs","Eyl","Ekm","Ksm","Arl"]
    day_names_short = ["Pts","Sal","Çrş","Per","Cum","Cts","Paz"]

    now = Time.now
    w_day_index = now.wday - 1 #pazardan başladığı için -1 yapıyorum
    month_index = now.month - 1 # 1'den başladığı için -1 yapıyorum

    tarih_uzun = day_names[w_day_index] + " " + 
    now.day.to_s + " " + 
    month_names[month_index] + " " + 
    now.year.to_s

    tarih_kısa = day_names_short[w_day_index] + " " + 
    now.day.to_s + " " + 
    month_names_short[month_index] + " " + 
    now.year.to_s

    case n
    when 1
        return tarih_kısa
    when 2
        return tarih_uzun
    end
end
puts give_me_date(1)
puts give_me_date(2)

puts "-----------------"
puts "This is a different scenario, when you add 1 it adds 1 day"
puts "MAGIC - next 5 fridays"
t1 = DateTime.now
t2 = DateTime.now + 30
next_30_days = t1..t2
# Example use
puts next_30_days.select(&:friday?).map(&:day)