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

var jQuery = require("jquery");

// import jQuery from "jquery";
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

console.log('Hello World from Webpacker')

import "bootstrap";
import "../packs/scripts/custom";
import "@fortawesome/fontawesome-free/js/all";
import "moment";
var noUiSlider = require("nouislider");
global.noUiSlider = noUiSlider;
window.noUiSlider = noUiSlider;
import "../packs/assets/js/core/bootstrap-material-design.min.js";
import "../packs/assets/js/material-kit";


// import "nouislider";
// // import moment from 'moment';
// import * as moment from 'moment';
// import 'moment/locale/pl';
// moment().format();

// moment = require("../packs/assets/js/plugins/moment.min.js");

require("../packs/assets/js/plugins/bootstrap-datetimepicker")

require.context("../packs/assets/img", true);



// const importAll = (r) => r.keys().map(r)

// importAll(require.context('packs/assets/img/', true, /\.(png|jpe?g|svg)$/));

$(document).on('page:change', function () { /* your code here */ });