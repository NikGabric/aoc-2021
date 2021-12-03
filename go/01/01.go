package main

import (
	"fmt"
	"strconv"
)

func main() {
	count := 0
	var lines []int 
	var line string
	for {
		fmt.Scanf("%s", &line)
		fmt.Println(line)
		if line == "0" {
			break
		}
		lineInt, _ := strconv.Atoi(line)
		lines = append(lines, lineInt)
	}
	
	for i, el := range lines {
		if i == len(lines)-3{
			break
		}
		window1 := el + lines[i+1] + lines[i+2]
		window2 := lines[i+1] + lines[i+2] + lines[i+3]
		if window1 < window2 {
			count++
		}
	}
	fmt.Println(count)
}
