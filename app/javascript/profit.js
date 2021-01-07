window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - (inputValue * 0.1)
  })
  });