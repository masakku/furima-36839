window.addEventListener("load", function(){

const priceInput = document.getElementById("item-price")
const addTaxDom = document.getElementById("add-tax-price")
const profitPrice = document.getElementById("profit")

priceInput.addEventListener("input", function(){
  const inputValue = priceInput.value;
  addTaxDom.innerHTML = Math.floor(inputValue / 10)
  console.log(addTaxDom.innerHTML)
  profitPrice.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
})

})