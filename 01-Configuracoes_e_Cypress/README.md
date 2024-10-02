# Cypress

## 🔍 Sobre
    Cypress é uma poderosa ferramenta de automação de testes end-to-end projetada especificamente para aplicações web. Sua abordagem intuitiva permite que desenvolvedores escrevam testes de maneira eficiente, utilizando uma sintaxe clara e fácil de entender. Além disso, oferece uma interface visual que facilita a depuração, possibilitando a execução em tempo real dos testes e fornecendo relatórios detalhados sobre os resultados. Com Cypress, é possível simular interações reais do usuário, validar funcionalidades da aplicação e garantir que tudo opere conforme o esperado.

## 📘 Aula
Nesta aula, exploramos as noções básicas da ferramenta e configuramos o ambiente inicial para testes. 

No arquivo [spec.cy.js](cypress/e2e/spec.cy.js), realizamos uma série de testes para familiarizar-nos com a sintaxe do Cypress e a estrutura necessária para programar os testes de forma eficaz.

## 📝 Testes

Os testes automatizados foram realizados no site do repositório de testes [the-internet](https://the-internet.herokuapp.com/login). As seguintes automações foram implementadas:

1. **Login com credenciais corretas**: Validamos que o sistema permite acesso ao usuário quando informações válidas são fornecidas.
2. **Login com credenciais erradas**: Verificamos que o sistema rejeita o acesso e exibe a mensagem de erro apropriada quando credenciais inválidas são inseridas.
3. **Validação de Campos Obrigatórios**: Confirmamos que campos obrigatórios (como nome de usuário e senha) não podem ser deixados em branco, assegurando que o sistema não permita a submissão do formulário sem essas informações.

Ao final de cada teste, asseguramo-nos de que os resultados correspondem às expectativas definidas, registrando qualquer discrepância que possa ocorrer.

## ✔ Conclusões

    Após a execução dos testes, ficou evidente que o sistema opera conforme projetado. Todos os testes foram finalizados com sucesso, confirmando que as funcionalidades básicas de login e validação de campos estão funcionando corretamente. Isso valida a eficácia do Cypress como uma ferramenta de automação de testes, facilitando o processo de verificação de qualidade do software.
