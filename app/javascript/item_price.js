window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const handlingCharge = document.getElementById("add-tax-price");
    handlingCharge.innerHTML = Math.floor(inputValue * 0.1)
    const benefit = document.getElementById("profit");
    console.log(benefit);
    benefit.innerHTML = Math.floor(inputValue - handlingCharge.innerHTML)
    
  })
});
