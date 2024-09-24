describe('Testes de Login', () => {
  it('Login com credenciais certas', () => {
    cy.visit('https://the-internet.herokuapp.com/login')
    cy.get('input[type="text"]').type('tomsmith')
    cy.get('input[type="password"]').type('SuperSecretPassword!')

    cy.get('button').click()
    cy.url().should('include', '/secure');
    cy.get('.flash.success').should('contain', 'You logged into a secure area!');
  })

  it('Login com credenciais erradas', () => {
    cy.visit('https://the-internet.herokuapp.com/login')
    cy.get('input[type="text"]').type('tomsmith')
    cy.get('input[type="password"]').type('senhaerrada')

    cy.get('button').click()
    cy.get('.flash.error').should('contain', 'Your password is invalid!');
  })

  it('validacao login sem senha', () => {
    cy.visit('https://the-internet.herokuapp.com/login')
    cy.get('button').click()
    cy.get('.flash.error').should('contain', 'Your username is invalid!');
  })
})