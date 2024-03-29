// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { initMapbox } from '../plugins/init_mapbox'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { changeNavbarOnScroll } from '../components/change_navbar_on_scroll'
import { toggleCityCriteriaButtonsCompartiment, toggleCityCriterionLine, toggleCitySearchResume } from '../components/toggle_city_filters'
import { initConversationalForm } from '../plugins/init_conversational_form'
import { clickHeartButton } from '../components/click_heart_button'

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  changeNavbarOnScroll();
  initMapbox();
  toggleCityCriteriaButtonsCompartiment();
  toggleCityCriterionLine();
  toggleCitySearchResume();
  initConversationalForm();
  clickHeartButton();
});
