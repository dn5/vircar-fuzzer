## vircar-fuzzer
This is a simple script (fuzzer) used as an example of hacking a car and vehicle CAN bus protocol. You may want to read more about it on my blog [here](http://dn5.ljuska.org/napadi-na-auto-sistem-1.html) and [here](http://dn5.ljuska.org/cyber-attacks-on-vehicles-2.html). Please note that this script goes along with a virtual car written in C, which you can check on Github too and it's located @ [vircar](https://github.com/dn5/vircar)

## requirements

* Ruby 2.2.3
* nothing else

cool, right?

## technique
This is a special fuzzing technique used to pwn and mod ECUs of a computer. Use this script only, and only on **vircar** (virtual car) and not on your real car. The fuzzing may break and crash your engine or computer car system.

## usage
To generate a random 4 chars long operations (DATA) that will be sent as frame use **g** argument.

	$ ruby vircar-fuzzer.rb g

To fuzz the vircar system run the script without any arguments.

	$ ruby vircar-fuzzer.rb

Make sure that [vircar](https://github.com/dn5/vircar) is up and running and virtual CAN bus is open.

## more information?
If you are looking for more information, read the blog post above and read the script.  
You can contact me on [twitter](https://twitter.com/dn5__) or send issue request to this repository if something is not working right.