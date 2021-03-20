const toggleCityCriteriaButtonsCompartiment = () => {
  const filtersButton = document.querySelector('#criteria-btn');
  if (filtersButton) {
    filtersButton.addEventListener('click', (e) => {
      e.preventDefault();
      const filters = document.querySelector('#criteria');
      if (filters.classList.contains('show')) {
        filters.classList.remove("show");
        filtersButton.classList.remove("active");
      } else {
        filters.classList.add("show");
        filtersButton.classList.add("active");
      }
    });
  }
}

const toggleCityCriterionLine = () => {
  const filterButtons = document.querySelectorAll('.criterion');
  if (filterButtons) {
    filterButtons.forEach(button => {
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

const toggleCitySearchResume = () => {
  const searchResumeButton = document.querySelector('#search-resume-btn');
  if (searchResumeButton) {
    console.log('hello');
    searchResumeButton.addEventListener('click', (e) => {
      e.preventDefault();
      const searchResume = document.querySelector('#search-resume');
      if (searchResume.classList.contains('show')) {
        searchResume.classList.remove("show");
        searchResumeButton.classList.remove("active");
      } else {
        searchResume.classList.add("show");
        searchResumeButton.classList.add("active");
      }
    });
  }
}

export { toggleCityCriteriaButtonsCompartiment, toggleCityCriterionLine, toggleCitySearchResume };
