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
    cy.get('a[href="/products"]').click()
    cy.get('input[id="search_product"]').type(nomeProduto)
    cy.get('button[id="submit_search"]').click()
    cy.get('a[href="/product_details/30"]').click()
})

// Comando customizado para logar na conta usando um login e senha
Cypress.Commands.add('logarNaConta', (email, senha) => {
    cy.get('a[href="/login"]').click()
    cy.get('input[data-qa="login-email"]').type(email)
    cy.get('input[data-qa="login-password"').type(senha)
    cy.get('button[data-qa="login-button"]').click()
})

// Prenchimento dos campos de fomulário de pagamentos
Cypress.Commands.add('preencherFormularioPagamento', (nome, numero, cvc, mes, ano) => {
    cy.get('input[data-qa="name-on-card"]').type(nome);
    cy.get('input[data-qa="card-number"]').type(numero);
    cy.get('input[data-qa="cvc"]').type(cvc);
    cy.get('input[data-qa="expiry-month"]').type(mes);
    cy.get('input[data-qa="expiry-year"]').type(ano);
  });
  