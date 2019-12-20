# prompt("CoffeeScript is loaded. LINE ITEM will be added or updated")

cart = document.getElementById("side_cart")
cart_first_empty = document.getElementById("side_cart_first_empty")

if cart_first_empty
  cart = cart_first_empty

if cart
  cart.style.display = "block"

cart.innerHTML = "<%= j render(@cart) %>"

if cart_first_empty
  window.location.href = '#side_cart_first_empty'
else
  window.location.href = '#side_cart'

notice = document.getElementById("notice")
if notice
  notice.style.display = "none"
