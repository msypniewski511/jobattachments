import 'core-js/stable'
import 'regenerator-runtime/runtime'
// require("@rails/ujs").start()
// require("@rails")
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")

/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
require.context("../packs/assets/img", true);
import "@fortawesome/fontawesome-free/js/all";
require("@fortawesome/fontawesome-free");
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
// import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'

// Add all icons to the library so you can use it in your page
library.add(fas, fab)

var jQuery = require("jquery");
// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

import "bootstrap";
import "../packs/assets/js/core/bootstrap-material-design.min.js";
import "moment";
require("../packs/assets/js/plugins/bootstrap-datetimepicker");
var noUiSlider = require("nouislider");
global.noUiSlider = noUiSlider;
window.noUiSlider = noUiSlider
import 'nouislider/distribute/nouislider.css';
import "../src/plugins/jquery.sharrre";



import "../packs/scripts/custom";
import "../packs/assets/js/material-kit";

// $(document).ready(function () { $('body').bootstrapMaterialDesign(); });
// $(document).ready(function () {



//   if ($('.datetimepicker').length != 0) {
//     // init DateTimePickers
//     materialKit.initFormExtendedDatetimepickers();
//   }
//   // var noUiSlider = require("nouislider");
//   // global.noUiSlider = noUiSlider;
//   // window.noUiSlider = noUiSlider;
//   if ($('.slider').length != 0) {
//     // Sliders Init
//     materialKit.initSliders();
//   }
// });




$(document).ready(function () {


  //init DateTimePickers
  materialKit.initFormExtendedDatetimepickers();

  // Sliders Init
  materialKit.initSliders();
});


function scrollToDownload() {
  if ($('.section-download').length != 0) {
    $("html, body").animate({
      scrollTop: $('.section-download').offset().top
    }, 1000);
  }
}



// const importAll = (r) => r.keys().map(r)

// importAll(require.context('packs/assets/img/', true, /\.(png|jpe?g|svg)$/));

// $(document).ready(function () { $('body').bootstrapMaterialDesign(); });