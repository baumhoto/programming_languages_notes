package main

import "fmt"

var big = 100
var small = 1

func test() {
	fmt.Println(guessMyNumber())
}

func int guessMyNumber() {
	return big + small / 2	
}