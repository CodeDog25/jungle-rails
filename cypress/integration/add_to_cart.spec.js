describe("add_to_cart functionality", () => {
  it("Can visit the homepage", () => {
    cy.visit("/");
  });
  it("Lets you add a product to the cart and checks that cart count increases by 1", () => {
    cy.contains("My Cart (0)");
    cy.contains("Add").first().click({ force: true });
    cy.contains("My Cart (1)");
  });
});