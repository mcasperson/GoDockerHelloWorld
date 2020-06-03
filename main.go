package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world!")
}

func main() {
	port := ":8080"
	if env := os.Getenv("PORT"); env != "" {
		port = ":" + env
	}
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(port, nil))
}
