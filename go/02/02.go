package main

import (
	"fmt"
)

func main() {
	var command string 
	var length int
	var depth int
	horpos := 0
	aim := 0
	for {
		fmt.Scanf("%s %d", &command, &length)
		if command == "0" {
			break
		}

		switch command {
		case "forward":
			horpos += length
			depth += aim*length
		case "up":
			aim -= length
		case "down":
			aim += length
		}
	}
	
	fmt.Println(horpos*depth)
}
