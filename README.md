# projeto_ruby_capybara
Projeto de teste automatizado utilizando o Ruby com Capybara com o site do Webjump

## Introdução

Neste projeto de teste automatizado, foi utilizado o website - https://wejump-automation-test.github.io/qa-test/ para realização do teste.
As ferramentas utilizadas foram: Ruby e Capybara. O Ruby foi utilizado como a linguagem para realizar a estrutura do código e
o Capybara é uma biblioteca escrita na linguagem de programação Ruby, que facilita a simulação de como um usuário interage com
o seu aplicativo ou site.

### Iniciando o projeto

Para iniciar o projeto em ruby devemos rodar os seguintes comandos abaixo:

**Iniciando o projeto na pasta selecionada**

````shell
bundle init
````

O comando acima vai gerar o arquivo Gemfile. Neste arquivo contêm todas as dependências de gem para programas Ruby. As gems
usadas foram: 
* capybara
* rspec
* selenium-webdriver
* ffi

Use o **Bundler** para gerenciar as dependências do aplicativo ruby on rails, instalando todas as gems necessárias.

````shell
gem install bundle
````
Para baixar as dependências do gems informadas, rode o comando abaixo:

````shell
bundle install
````

### Instalando o Rspec no Projeto
O **Rspec** é uma ferramenta de teste "Domain Specific Language" escrita em Ruby para testar o código em Ruby. É uma estrutura
de desenvolvimento orientada a comportamento que é amplamente usada em aplicativos de produção.

O comando abaixo irá instalar as dependências do rspec no projeto:

````shell
rspec --init
````
Assim o sistema irá adicionar os arquivos:
* .rspec (a pasta)
* spec/spec_helper.rb

### Observação:
Neste projeto foi utilizado o Chrome para a automação web. Para rodar no Windows é necessário a instalação do ChromeDriver.
Link da configuração: https://chromedriver.chromium.org/downloads. Depois de baixar, deverá indicar a pasta no PATH do windows.

Link para instalação no Mac: https://www.edureka.co/community/52315/how-to-setup-chrome-driver-with-selenium-on-macos
Link para instalação no Linux: https://tecadmin.net/setup-selenium-chromedriver-on-ubuntu/

**Atenção: Tendo já instalado o Chromedriver no Mac, eu adicionei a configuração do Chromedriver no código do sistema no
arquivo spec_helper.rb. Abaixo segue o código que adicionado (pode funcionar também no Windows):**
````shell
Capybara.configure do |config|  #nesta parte estou dizendo que meu projeto rodará no Chrome.
  config.default_driver = :selenium_chome
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[headless enable-features=NetworkService,NetworkServiceInProcess]
    }
  )
Capybara::Selenium::Driver.new app,
  browser: :chrome,
  desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome

````

**O outro código acima, ainda no arquivo - spec_helper.rb JÁ VEM COMO PADRÃO NO CÓDIGO DO Rspec em Ruby!**

### Executando o Projeto
Para executar o projeto, deverá abrir o terminal ou cmd na pasta onde está armazenado o projeto (se for no Windows - melhor 
será colocar a pasta do projeto no C:\) e executar o seguinte comando abaixo:
````shell
rspec
````
**OBS: Como tem dois projeto, se rodar só o comando RSPEC, ele irá executar todos os dois projetos (teste1_spec.rb e test2_
dropdown_spec.rb. Foi colocado o elemento "dropdown" dentro do arquivo do teste2, para que o desenvolvedor execute o projeto
requerido**

Para executar o seguindo projeto, execute o comando abaixo:
````shell
rspec --tag @dropdown
````




