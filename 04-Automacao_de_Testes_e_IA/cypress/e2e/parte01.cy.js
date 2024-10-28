describe('Navegação pela página', () => {

  // Visitar a mesma página em todo teste
  beforeEach(() => {
    cy.visit('https://automationexercise.com/')
  })

  
  it('Busca de produtos', () => {
    cy.pesquisarProduto('T-shirts')
  })

  it('Efetuar Login com credencias certas', () => {
    cy.logarNaConta('usercypress@mail.com', 'cypress')
    cy.get('#header > div > div > div > div.col-sm-8 > div > ul > li:nth-child(4) > a').should('contain', 'Logout');
  })
  

  it('Efetuar Login com credencias incorretas', () => {
    cy.logarNaConta('user@mail.com', 'user')
    cy.url().should('include', '/login');
    cy.get('#form > div > div > div.col-sm-4.col-sm-offset-1 > div > form > p').should('contain', 'incorrect');
  })

  // Seguindo todos os passos no processo de checkout até a compra
  it('Processo de checkout', () => {
    cy.logarNaConta('usercypress@mail.com', 'cypress')
    cy.pesquisarProduto('T-shirts')
    cy.get('body > section > div > div > div.col-sm-9.padding-right > div.product-details > div.col-sm-7 > div > span > button').click()
    cy.get('#cartModal > div > div > div.modal-body > p:nth-child(2) > a > u').click()
    cy.get('#do_action > div.container > div > div > a').click()
    cy.get('#ordermsg > textarea').type('Deixa o like Família!')
    cy.get('#cart_items > div > div:nth-child(7) > a').click()
    cy.preencherFormularioPagamento('Deixa', 'o', 'like', 'familia', '!')
    cy.get('#submit').click()
    cy.url().should('include', '/payment_done')
  }) 
})