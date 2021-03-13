const toggleCityCriteriaButtonsCompartiment = () => {
  const filters_button = document.querySelector('#criteria-btn');
  if (filters_button) {
    filters_button.addEventListener('click', (e) => {
      e.preventDefault();
      const filters = document.querySelector('#criteria');
      if (filters.classList.contains('show')) {
        filters.classList.remove("show");
        filters_button.classList.remove("active");
      } else {
        filters.classList.add("show");
        filters_button.classList.add("active");
      }
    });
  }
}

const toggleCityCriterionLine = () => {
  const filter_buttons = document.querySelectorAll('.criterion');
  if (filter_buttons) {
    filter_buttons.forEach(button => {
      button.addEventListener('click', (e) => {
        e.preventDefault();
        const filterId = `${button.innerText.toLowerCase()}-criterion`;
        const filterDiv = document.getElementById(filterId);
        if (filterDiv.classList.contains('show')) {
          filterDiv.classList.remove("show");
          button.classList.remove("btn-primary");
          button.classList.add("btn-outline-primary");
        } else {
          filterDiv.classList.add("show")
          button.classList.remove("btn-outline-primary");
          button.classList.add("btn-primary");
        }
      });
    });
  }
}

export { toggleCityCriteriaButtonsCompartiment, toggleCityCriterionLine };
