# vircan-fuzzer
# This is a vircar (https://github.com/dn5/vircar) fuzzer
# written in Ruby as an layout for generating and trying
# the data fuzz on our virtual CAN
# -
# 
# = generate the fuzzer combinations
# 	ruby vircar-fuzzer.rb g
# 
# = run vircar with following command
#   sudo ./vircar | tee ~/vircar-fuzzer.txt
#   
# = run the fuzzer and hack the system
#   ruby vircar-fuzzer.rb


def bin_to_hex(s)
  return s.each_byte.map { |b| b.to_s(16) }.join
end

def print_head
	puts "vircan-fuzzer"
	puts "https://github.com/dn5/vircar-fuzzer"
	puts "-"
	puts "Coded by dn5 (@dn5__)"
end

def generate_rand(i)
	@gen = [];

	o = 'QWERTYUIOPASDFGHJKLZXCVBNM'.chars
	@gen.push(o.product(o, o, o).first(i).map(&:join))

	write_fuzz_start(i)

	return
end

def write_fuzz_start(i) # Write starting point for fuzzing
	file = File.open("start", "w") { |file| file.write(i) }
end

def get_fuzz_start # Get starting point for fuzzing (make it faster)
	file = File.new("start", "r")
	
	while (line = file.gets)
		@line = "#{line}".to_i
		puts "Starting from line: " + @line.to_s
	end

	file.close
end

def write_arr_to_file
	File.open("frames", "w") do |f|
		@gen.each { |element| f.puts(element) }
	end
end

def hack_the_car
	file = File.open("frames", "r")

	while (line = file.gets)
		@current = "#{line}".to_s
		@hexed   = bin_to_hex(@current)
		@hexed   = @hexed.upcase

		@hexed   = @hexed[0...-1]

		puts "Current line: " + @current
		puts "Hexed: " + @hexed

		p system("cangen vircar -D " + @hexed + " -n 1")
	end

	file.close
end

def main
	print_head # He-he :)
	get_fuzz_start

	while @line < 456976 # try all possibilities
		generate_rand(@line)
		@line += 1;

		write_arr_to_file
	end

	#@gen.inspect
end

print_head

@arguments = ARGV
	case @arguments[0]
	when "g"
		main
	else
		hack_the_car
	end