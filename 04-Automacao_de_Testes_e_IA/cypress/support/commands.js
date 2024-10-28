// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************


// Comando customizado  para pesquisar um certo tipo de produto nos filtros de produto
Cypress.Commands.add('pesquisarProduto', (nomeProduto) => {
    cy.get('#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(2) > a').click()
    cy.get('#search_product').type(nomeProduto)
    cy.get('#submit_search').click()
    cy.get('body > section:nth-child(3) > div > div > div.col-sm-9.padding-right > div > div.col-sm-4 > div > div.choose > ul > li > a').click()
})

// Comando customizado para logar na conta usando um login e senha
Cypress.Commands.add('logarNaConta', (email, senha) => {
    cy.get('#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(4) > a').click()
    cy.get('#form > div > div > div.col-sm-4.col-sm-offset-1 > div > form > input[type=email]:nth-child(2)').type(email)
    cy.get('#form > div > div > div.col-sm-4.col-sm-offset-1 > div > form > input[type=password]:nth-child(3)').type(senha)
    cy.get('#form > div > div > div.col-sm-4.col-sm-offset-1 > div > form > button').click()
})

// Prenchimento dos campos de fomulário de pagamentos
Cypress.Commands.add('preencherFormularioPagamento', (nome, numero, cvc, mes, ano) => {
    cy.get('#payment-form > div:nth-child(2) > div > input').type(nome);
    cy.get('#payment-form > div:nth-child(3) > div > input').type(numero);
    cy.get('#payment-form > div:nth-child(4) > div.col-sm-4.form-group.cvc > input').type(cvc);
    cy.get('#payment-form > div:nth-child(4) > div:nth-child(2) > input').type(mes);
    cy.get('#payment-form > div:nth-child(4) > div:nth-child(3) > input').type(ano);
  });
  