# Robot Framework

## 🔍 Sobre

    Robot Framework is an open source automation framework for test automation and robotic process automation (RPA). It is supported by the Robot Framework Foundation and widely used in the industry.
    Its human-friendly and versalite syntax uses keywords and supports extending through libraries in Python, Java, and other languages.
    It integrates with other tools for comprehensive automation without licensing fees, bolstered by a rich community with hundreds of 3rd party libraries.
| [Robot Framework](https://robotframework.org/)

## 📘 Aula
Nesta aula, exploramos as noções básicas da ferramenta e configuramos o ambiente inicial para testes. 

No arquivo [teste_pesquisa_amazon.robot](teste_pesquisa_amazon.robot), realizamos um teste para familiarizar-nos com a sintaxe do Robot e a estrutura necessária para programar os testes de forma eficaz. Após isso, tivemos um desafio de modificar o script para entendermos melhor a lógica ultilizada no exemplo.

## 📝 Testes

Os testes automatizados foram realizados no site do repositório de testes [the-internet](https://the-internet.herokuapp.com/login). As seguintes automações foram implementadas:

1. **Login com credenciais corretas**: Validamos que o sistema permite acesso ao usuário quando informações válidas são fornecidas.
2. **Login com credenciais erradas**: Verificamos que o sistema rejeita o acesso e exibe a mensagem de erro apropriada quando credenciais inválidas são inseridas.
3. **Validação de Campos Obrigatórios**: Confirmamos que campos obrigatórios (como nome de usuário e senha) não podem ser deixados em branco, assegurando que o sistema não permita a submissão do formulário sem essas informações.

Ao final de cada teste, asseguramo-nos de que os resultados correspondem às expectativas definidas, registrando qualquer discrepância que possa ocorrer.

## ✔ Conclusões

Após a execução dos testes, ficou evidente que o sistema opera conforme projetado. Todos os testes foram finalizados com sucesso, confirmando que as funcionalidades básicas de login e validação de campos estão funcionando corretamente. Isso valida a eficácia do Cypress como uma ferramenta de automação de testes, facilitando o processo de verificação de qualidade do software.
