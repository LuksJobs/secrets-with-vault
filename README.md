
# HashiCorp Vault :
 
## Visão Geral 
O HashiCorp Vault é uma ferramenta projetada para armazenar e gerenciar informações sensíveis de forma segura, como chaves de API, senhas, certificados e muito mais. Ele fornece uma solução centralizada para gerenciamento de segredos e controle de acesso. 
 
## Recursos 
- **Gerenciamento de Segredos**: O Vault oferece uma maneira segura de armazenar e gerenciar segredos, garantindo que os dados sensíveis sejam criptografados em repouso e em trânsito. 
- **Segredos Dinâmicos**: Ele pode gerar segredos dinâmicos sob demanda para vários serviços, reduzindo o risco de credenciais de longa duração. 
- **Controle de Acesso**: O Vault fornece políticas de controle de acesso detalhadas para restringir e gerenciar o acesso de usuários aos segredos. 
- **Criptografia como Serviço**: Ele oferece criptografia como serviço, permitindo que aplicativos criptografem e descriptografem dados sem lidar diretamente com chaves de criptografia. 
- **Auditoria e Registro**: O Vault mantém um registro detalhado de todas as interações, fornecendo visibilidade e rastreabilidade para fins de conformidade. 
- **Integração e Extensibilidade**: Ele se integra a vários sistemas de autenticação, provedores de nuvem, bancos de dados e muito mais. 
 
## Primeiros Passos 
Para usar o HashiCorp Vault, siga estes passos: 
 
1. **Instalação**: Instale o Vault em seu servidor ou use a imagem oficial do Docker. 
2. **Inicialização**: Inicie o servidor do Vault para configurar as chaves de criptografia iniciais e o token raiz. 
3. **Desbloqueio**: Desbloqueie o Vault usando um número mínimo de chaves de desbloqueio para torná-lo operacional. 
4. **Autenticação**: Configure métodos de autenticação, como tokens, LDAP ou provedores de nuvem, para autenticar usuários e aplicativos. 
5. **Engine de Segredos**: Habilite e configure engines de segredos para armazenar e gerenciar segredos. 
6. **Políticas**: Defina políticas de controle de acesso para gerenciar permissões de diferentes usuários e aplicativos. 
7. **Acesso aos Segredos**: Use a API ou CLI do Vault para interagir com segredos, gerar segredos dinâmicos ou recuperar segredos armazenados. 
8. **Comunicação Segura**: Configure certificados TLS e comunicação de rede segura para proteger os dados em trânsito. 
9. **Alta Disponibilidade**: Configure o Vault em uma configuração altamente disponível para redundância e tolerância a falhas. 
10. **Monitoramento e Auditoria**: Habilite auditoria e monitoramento para rastrear e revisar as atividades do Vault. 
 
Para instruções detalhadas e exemplos, consulte a documentação oficial do HashiCorp Vault: [https://www.vaultproject.io/docs/](https://www.vaultproject.io/docs/) 
 
## Contribuições 
Contribuições para o HashiCorp Vault são bem-vindas! Se você encontrar algum problema ou tiver sugestões, por favor, envie-os para o repositório oficial do GitHub: [https://github.com/hashicorp/vault](https://github.com/hashicorp/vault) 
 
## Licença 
O HashiCorp Vault é lançado sob a Licença Pública Mozilla 2.0. Para mais detalhes, consulte o arquivo LICENSE. 
 
## Recursos 
- Site Oficial: [https://www.vaultproject.io/](https://www.vaultproject.io/) 
- Documentação: [https://www.vaultproject.io/docs/](https://www.vaultproject.io/docs/) 
- Repositório do GitHub: [https://github.com/hashicorp/vault](https://github.com/hashicorp/vault)

# Instalando o Serviço

Para levantar o serviço, basta rodar o comando abaixo:

```
$ docker compose up -d
```

Logo após para gerar as chaves de acesso ao cofre:

```
$ docker exec -it vault_unimed vault operator init -n 2 -t 2
```

Esse comando irá gerar duas chaves para acesso ao banco de dados;
🚩 É de extrema importância guardar as chaves e o Token que foram gerados em um local seguro

# Conexão do NodeJS com o Vault

Para fazer com que uma aplicação em Node.js consuma a chave "kv" (key value) no seu Vault, você pode usar a biblioteca cliente do Vault para Node.js. Aqui está um exemplo de como fazer isso: 
 
1. Instale a biblioteca cliente do Vault executando  npm install node-vault  no diretório do seu projeto Node.js. 
 
2. Importe a biblioteca do Vault na sua aplicação Node.js:

```
const vault = require('node-vault')();
```

3. Configure o cliente do Vault com o endpoint e o método de autenticação apropriados:

```
vault.options({
  apiVersion: 'v1',
  endpoint: 'http://seu-servidor-vault:8200',
  token: 'seu-token-vault',
});
```

Substitua  'http://seu-servidor-vault:8200' pela URL do seu servidor Vault e  'seu-token-vault'  por um token válido que tenha acesso às chaves. 
 
4. Recupere o segredo do "kv" engine:

```
const caminhoSegredo = 'secret/meuapp/config'; // Caminho para o seu segredo no engine "kv"
const resposta = await vault.read(caminhoSegredo);
const dadosSegredo = resposta.data;
```

Substitua  `'secret/meuapp/config'`  pelo caminho real para o seu segredo dentro do engine "kv". 
 
5. Agora você pode usar o objeto  dadosSegredo  na sua aplicação para acessar os valores do segredo recuperado. 
 
Seguindo essas etapas, sua aplicação Node.js será capaz de consumir segredos armazenados no engine "kv" do seu servidor Vault. Lembre-se de tratar erros adequadamente e implementar mecanismos de tratamento de erros e autenticação apropriados, de acordo com os requisitos da sua aplicação.