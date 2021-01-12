# [Boost.Timer](https://www.boost.org/libs/timer)

Boost.Timer provides classes to measure the time taken 
by a C++ program to execute and to display progress to a goal.

# Usage Examples
> **NOTE:** Make sure you include the ```-lboost_timer``` flag when compiling with ```timer.hpp```.

## How do I measure time for my program?

You can measure the total time for a program by adding only two lines of code to the scope you want to measure time on.

```auto_cpu_timer``` starts the timer when constructed and stops the timer when the destructor is called and outputs the time elapsed to the default output stream.

```c++
#include<boot/timer/timer.hpp>
//
void any_function(int n){
	boost::timer::auto_cpu_timer t;
	// function code ...
}
```

**You can also format the output of this object by passing in a string with the following format specifiers:*
```c++
boost::timer::auto_cpu_timer t("Wall time: %w\n");
```  
Format Specifier | Use
--- | ---  
 %w | Wall time   
 %u | User time   
 %s | System time 
 %t | User time + System time

## How do I measure time for specific sections in my program?

Boost.Timer also provides the ```cpu_timer``` class that can be used as a stopwatch in the program. 
It has functions like ```start```, ```stop```, ```resume```, ```is_stopped``` etc, which can be used to control the timer.
 
```c++
#include<boost/timer/timer.hpp>
#include<iostream>
#include<cmath>

void any_function(){

	boost::timer::cpu_timer timer;

	for(size_t i=0; i<10'000'000; i++){
		sqrt(i);
	}
	
	// More time-consuming code ...
	
	boost::timer::cpu_times elapsed_time = timer.elapsed();
	std::cout << "Wall time elapsed: " << elapsed_time.wall << std::endl;

}
```

Calling the ```elapsed``` function will return an object of type ```cpu_times``` that contains user, wall, and system time as attributes.  
For more info, checkout [this](https://www.boost.org/libs/timer/doc/cpu_timers.html) page.

## How do I display the progress of a task?

Here's a short demo on how to use the ```progress_display``` class.

> Note that we are using ```boost/timer/progress_display.hpp``` in this code snippet!

```c++
#include<iostream>
#include<boost/timer/progress_display.hpp>
#include<cmath>

int main(){

	const size_t i_limit = 1000;
	const size_t j_limit = 5'00'000;

	boost::timer::progress_display progress(i_limit); // Initialize with the total counts

	double x = 32, y = 56;
	for(size_t i=0; i<i_limit; i++){
		for(size_t j=0; j<j_limit; j++){
			x = sqrt(y*i) * 2 * y;
			y = i / x;
		}
		++progress;  // Update the progress bar
	}

	std::cout << "Completed Job!" << std::endl;

}
```

# License
Distributed under [Boost Software License, Version 1.0](https://www.boost.org/LICENSE_1_0.txt)