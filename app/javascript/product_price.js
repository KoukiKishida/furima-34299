window.addEventListener('load', () => {

priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  inputValue = priceInput.value;

   addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));

    profitNumber = document.getElementById("profit")
      value_result = inputValue * 0.1
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));
  })
});