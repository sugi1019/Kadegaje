// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

// Bootstrap
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; 

// raty用設定
import Raty from "../lib/raty"
window.raty = function(elem, opt) {
  const raty = new Raty(elem, opt);
  raty.init();
  return raty;
}

Rails.start()
Turbolinks.start()
ActiveStorage.start()
