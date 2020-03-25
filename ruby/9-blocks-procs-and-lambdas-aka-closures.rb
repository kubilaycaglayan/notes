proc_print = Proc.new { |x| print "#{x} "}

5.times(&proc_print)