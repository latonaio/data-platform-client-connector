exportDir := "export"
expire := 365

generate-private:
	openssl genrsa 2048 > $(exportDir)/privatekey.pem
