# Encurtador de Links

Este é um projeto de encurtador de links desenvolvido com Django e Django Ninja. A API permite criar links curtos, redirecionar para URLs longas, gerar QR Codes e obter estatísticas de cliques.

## Funcionalidades

- Encurtar URLs
- Redirecionar URLs curtas para URLs longas
- Gerar QR Codes para URLs curtas
- Obter estatísticas de cliques

## Requisitos

- Docker
- Docker Compose

## Configuração

1. Clone o repositório:

```sh
git clone https://github.com/SondTheAnime/Encurtador_Link.git
cd Encurtador_Link
```

2. Crie um arquivo `.env` na raiz do projeto e adicione as seguintes variáveis de ambiente:

```env
SECRET_KEY=sua-chave-secreta
DEBUG=True
ALLOWED_HOSTS=*
SITE_URL=http://localhost:8000/api
```

3. Construa e inicie os containers Docker:

```sh
docker-compose up --build
```

A aplicação estará disponível em `http://localhost:8000`.

## Endpoints

### Encurtar URL

- **URL:** `/api/shorten`
- **Método:** `POST`
- **Corpo da Requisição:**
  ```json
  {
    "redirect_link": "https://exemplo.com",
    "token": "opcional",
    "expiration_time": 60,  // em minutos
    "max_unique_cliques": 100
  }
  ```
- **Resposta de Sucesso:**
  ```json
  {
    "redirect_link": "https://exemplo.com",
    "token": "gerado-ou-fornecido",
    "expiration_time": 60,
    "max_unique_cliques": 100
  }
  ```

### Redirecionar URL

- **URL:** `/api/{token}`
- **Método:** `GET`
- **Resposta de Sucesso:** Redireciona para a URL longa.

### Gerar QR Code

- **URL:** `/api/qrcode/{link_id}`
- **Método:** `GET`
- **Resposta de Sucesso:** Retorna a imagem do QR Code.

### Estatísticas de Cliques

- **URL:** `/api/statistics/{link_id}`
- **Método:** `GET`
- **Resposta de Sucesso:**
  ```json
  {
    "uniques_clicks": 10,
    "total_clicks": 50,
    "daily_clicks": {
      "2025-01-10": 5,
      "2025-01-11": 10
    }
  }
  ```

## Testes

Para rodar os testes, use o comando:

```sh
docker-compose run web python manage.py test
```

## Contribuição

Sinta-se à vontade para contribuir com este projeto. Envie um pull request ou abra uma issue para discutir mudanças.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.