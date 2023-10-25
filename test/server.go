package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/index", index)

	err := http.ListenAndServeTLS(":8443", "export/ca.crt", "export/ca.key", nil)
	if err != nil {
		log.Fatalln(err)
	}
}

func index(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Hello, https!")
	w.Write([]byte("Hello, https!"))
}
