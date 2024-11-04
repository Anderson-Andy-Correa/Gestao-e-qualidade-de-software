describe('Navegação pela página', () => {

  // Visitar a mesma página em todo teste
  beforeEach(() => {
    cy.visit('https://automationexercise.com/')
  })

  
  it('Busca de produtos', () => {
    cy.pesquisarProduto('T-shirts')
    cy.url().should('include', '/product_details')
  })

  it('Efetuar Login com credencias certas', () => {
    cy.logarNaConta('usercypress@mail.com', 'cypress')
    cy.get('a[href]').should('contain', 'Logout');
  })
  

  it('Efetuar Login com credencias incorretas', () => {
    cy.logarNaConta('user@mail.com', 'user')
    cy.url().should('include', '/login');
    cy.get('p').should('contain', 'incorrect');
  })

  // Seguindo todos os passos no processo de checkout até a compra
  it('Processo de checkout', () => {
    cy.logarNaConta('usercypress@mail.com', 'cypress')
    cy.pesquisarProduto('T-shirts')
    cy.get('button[class="btn btn-default cart"]').click()
    cy.get('div[id="cartModal"] a[href="/view_cart"]').click()
    cy.get('a[class="btn btn-default check_out"]').click()
    cy.get('textarea[name="message"]').type('Deixa o like Família!')
    cy.get('a[href="/payment"]').click()
    cy.preencherFormularioPagamento('Deixa', 'o', 'like', 'familia', '!')
    cy.get('button[id="submit"]').click()
    cy.url().should('include', '/payment_done')
  }) 
})