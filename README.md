# pgtune\_frontend

An elm made frontend for [pgtune](https://github.com/sainth-/pgtune)

## Usage

This project is deployed at [https://pgtune.sainth.de](https://pgtune.sainth.de).

## Prerequisites

To compile this project you need to install and put in path:

- [elm](https://elm-lang.org) 0.19 - [Official elm installation guide](https://guide.elm-lang.org/install/elm.html).
- [sass](https://sass-lang.com/)

To run this project you need [pgtune](https://github.com/sainth-/pgtune/) accessible via "/api" relative to the frontend.

A nginx sample configuration could be on premise that the frontend is reachable via <http://localhost:8000/>:

```nginx
    server {
        listen       80;
        server_name  localhost;

        location / {
        proxy_pass http://localhost:8000/;
        }

        location /api/ {
        proxy_pass https://pgtune.sainth.de/api/;
        }
    }
```

## Getting started

1. Checkout
2. Build/Assemble
3. Start

### MacOs/Linux

```bash
git clone https://github.com/sainth-/pgtune_frontend.git
cd pgtune_frontend
./build.sh -b all
elm reactor
```

### Windows

```bash
git clone https://github.com/sainth-/pgtune_frontend.git
cd pgtune_frontend
elm make --optimize src/Main.elm
sass --style compressed  styles/pgtune.sass styles.css
elm reactor
```

## Contributing

Feel free to send a pull request.

## Acknowlegdement

This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project. By using the [openapi-spec](https://github.com/OAI/OpenAPI-Specification) from a remote server, you can easily generate an API client.

- API version: 1.0
- Build package: org.openapitools.codegen.languages.ElmClientCodegen

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
