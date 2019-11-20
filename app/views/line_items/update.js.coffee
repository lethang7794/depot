# prompt("CoffeeScript is loaded. PRODUCT will be add UPDATED")

cart = document.getElementById("side_cart")
cart_first_empty = document.getElementById("side_cart_first_empty")

if cart_first_empty
  cart = cart_first_empty

if cart
  cart.style.display = "block"

cart.innerHTML = "<%= j render(@cart) %>"
