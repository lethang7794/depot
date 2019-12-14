# prompt("CoffeeScript is loaded. CART will be DELETED")

cart = document.getElementById("side_cart")
cart_first_empty = document.getElementById("side_cart_first_empty")

if cart_first_empty
  cart = cart_first_empty

if cart
  cart.style.display = "none"
