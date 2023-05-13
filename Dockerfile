FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY . .

#Executa o comando para inicializar o módulo e executar o build do código.
RUN go mod init helloworld \
&& go build -mod=readonly -v -o /app main.go

FROM scratch
COPY --from=builder /app /app

CMD ["/app"]