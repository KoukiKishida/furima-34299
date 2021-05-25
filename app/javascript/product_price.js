window.addEventListener('load', () => {

priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  inputValue = priceInput.value;
   console.log(inputValue);

   addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTaxDom);

    profitNumber = document.getElementById("profit")
      value_result = inputValue * 0.1
      console.log(value_result)
      profitNumber.innerHTML = (Math.floor(inputValue - value_result));
        console.log(profitNumber);
  })
});