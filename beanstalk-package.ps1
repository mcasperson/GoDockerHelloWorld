$env:GOOS="linux"
$env:GOARCH="amd64"
go build .
Compress-Archive -Path helloworld, Procfile, .ebextensions -DestinationPath beanstalk-app-bundle.zip -Force