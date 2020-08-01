import 'core-js/stable'
import 'regenerator-runtime/runtime'
// import("@rails/ujs").start()
// require("@rails/webpacker")
// require("turbolinks").start()
require("@rails/activestorage").start()
// require("channels")


require.context("../packs/assets/img", true);
import "@fortawesome/fontawesome-free/js/all";
import("@fortawesome/fontawesome-free");
import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
library.add(fas, fab)

global.$ = global.jQuery = jQuery;

import "bootstrap";
import "../packs/assets/js/core/bootstrap-material-design.min.js";
import "moment";
import("../packs/assets/js/plugins/bootstrap-datetimepicker");

var noUiSlider = require("nouislider");
global.noUiSlider = noUiSlider;
window.noUiSlider = noUiSlider

import 'nouislider/distribute/nouislider.css';
import "../src/plugins/jquery.sharrre";

import('jquery');
require("chart.js");
import "../packs/scripts/custom";
import "../src/material-dashboard";

import "../demo/demo";



$(document).ready(function () {


  //init DateTimePickers
  // materialKit.initFormExtendedDatetimepickers();

  // // Sliders Init
  // materialKit.initSliders();

  // var oTable = $('#example').dataTable();

  // Filter to rows with 'Webkit' in them, add a background colour and then
  // remove the filter, thus highlighting the 'Webkit' rows only.
  // oTable.fnFilter('Webkit');
  // oTable.$('tr', { "search": "applied" }).css('backgroundColor', 'blue');
  // oTable.fnFilter('');
});


// function scrollToDownload() {
//   if ($('.section-download').length != 0) {
//     $("html, body").animate({
//       scrollTop: $('.section-download').offset().top
//     }, 1000);
//   }
// }
