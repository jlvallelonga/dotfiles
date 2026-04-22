
# go
gog () { go get $@; asdf reshim golang; }
goi () { go install $@; asdf reshim golang; }
gmi () { go mod init github.com/$GITHUB_USERNAME/$@; }
gmt () { go mod tidy; }
gmd () { go mod download; }
gt () { go test ./... --coverprofile=c.out; }
gtcover () { gt; go tool cover -html c.out; }
gcover () { go tool cover -html c.out; }
