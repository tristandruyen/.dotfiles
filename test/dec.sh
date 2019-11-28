cat Fonts.tar.gz.aes | aespipe -d -P ./pass | (base64 -d) | tee Fonts-New.tar.gz
