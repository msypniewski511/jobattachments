
import 'core-js/stable'
import 'regenerator-runtime/runtime'
import("@rails/ujs");
import Rails from "@rails/ujs"
Rails.start()
// require("@rails/webpacker")
// require("turbolinks").start();
// require("@rails/activestorage").start()
// require("channels")
var Turbolinks = require('turbolinks');
// Turbolinks.start()
import * as bg_sort from 'datatables.net-dt/images/sort_both.png'
// import sort_asc from 'datatables.net-dt/images/sort_asc.png'
// import sort_desc from 'datatables.net-dt/images'

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

var dt = require('datatables.net-dt');

import "../src/material-dashboard";

import "../demo/demo";

// es modules are recommended, if available, especially for typescript
import flatpickr from "flatpickr";
import { initial } from 'lodash';
// require("flatpickr/src/style/themes")

$(document).ready(function () {
  flatpickr('[data-behavior="flatpickr"]', {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
  })
  dt
  $('#table_id').DataTable();
});
$(document).on('turbolinks:load', () => {
  console.log("sfsadfsadf")
})

// document.addEventListener('document:load', () => {
//   // data-behavior="flatpickr"
//   flatpickr('[data-behavior="flatpickr"]', {
//     altInput: true,
//     altFormat: "F j, Y",
//     dateFormat: "Y-m-d",
//   })
// })

// function scrollToDownload() {
//   if ($('.section-download').length != 0) {
//     $("html, body").animate({
//       scrollTop: $('.section-download').offset().top
//     }, 1000);
//   }
// }
// $(document).on('page:fetch', function () {
//   $(".loading-indicator").show();
// });
// $(document).on('page:change', function () {
//   $(".loading-indicator").hide();
// });

