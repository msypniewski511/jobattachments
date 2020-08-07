
import 'core-js/stable'
import 'regenerator-runtime/runtime'
import("@rails/ujs");
// import Rails from "@rails/ujs"
// Rails.start()
// require("@rails/webpacker")
// require("turbolinks").start();
// require("@rails/activestorage").start()
// require("channels")
// var Turbolinks = require('turbolinks');
// Turbolinks.start()
import * as bg_sort from 'datatables.net-dt/images/sort_both.png'
// import sort_asc from 'datatables.net-dt/images/sort_asc.png'
// import sort_desc from 'datatables.net-dt/images'

require.context("../packs/assets/img", true);
require.context('../images', true);
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

import "../src/material-kit"
import "base"

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
    defaultDate: new Date(1960, 0, 10)
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

const { postcodes } = require("@ideal-postcodes/api-fixtures");

// Example for postcodes->success

$(document).ready(function () {
  // console.log(postcodes.success);

  // fetch('url: "https://api.postcodes.io",
  // //   query: {
  // //   api_key: ak_kdh96k99toM85adHd8xyIDxtS67la
  // // },
  // //   headers: {}')

  // const { Client } = require("@ideal-postcodes/core-browser");
  // const client = new Client({ api_key: "ak_kdh96k99toM85adHd8xyIDxtS67la" });
  // // var getJSON = require("async-get-json");

  // const udprn = 5770157;
  // let address
  // client.lookupUdprn({ udprn }).then(res => address = res).catch(e => console.log(e));;
  // console.log(address);

  // const umprn = 12345;
  // let mrOccupancy
  // client.lookupUmprn({ umprn }).then(res => mrOccupancy = res).catch(e => console.log(e));


  // console.log(mrOccupancy);

  // mrOccupancy;
  // timedFetch()

  szukaj1();
})





import('@ideal-postcodes/api-fixtures');
import('@ideal-postcodes/core-browser');

var setupPostcodeLookup = require('../src/plugins/postcode')
function szukaj1() {

  $('#customButton').on('click', (e) => {
    e.preventDefault();
  })
  $('#lookup_field').setupPostcodeLookup({
    api_key: 'ak_kdh96k99toM85adHd8xyIDxtS67la',
    output_fields: {
      line_1: '#first_line',
      line_2: '#second_line',
      line_3: '#third_line',
      post_town: '#post_town',
      postcode: '#postcode',
      longitude: '#longitude',
      latitude: '#latitude',
      udprn: '#udprn'
    },
    button: '#customButton',

    onSearchCompleted: function (data) {
      if (data.code === 2000) {
        // Success
        $("#successStatus").html("Success!\n" + JSON.stringify(data, 2, 2));
      } else if (data.code === 4040) {
        // Postcode does not exist
        $("#successStatus").html("Postcode does not exist!\n" + JSON.stringify(data, 2, 2));
      } else {
        $("#successStatus").html("Some error occurred\n" + JSON.stringify(data, 2, 2));
      }
    }


  });

  $('#lookup_field_company').setupPostcodeLookup({
    api_key: 'ak_kdh96k99toM85adHd8xyIDxtS67la',
    output_fields: {
      line_1: '#first_line_company',
      line_2: '#second_line_company',
      line_3: '#third_line_company',
      post_town: '#post_town_company',
      postcode: '#postcode_company',
      longitude: '#longitude_company',
      latitude: '#latitude_company',
      udprn: '#udprn_company'
    },
    button: '#customButton_company',
    onSearchCompleted: function (data2) {
      if (data2.code === 2000) {
        // Success
        $("#successStatus").html("Success!\n" + JSON.stringify(data2, 2, 2));
      } else if (data2.code === 4040) {
        // Postcode does not exist
        $("#successStatus").html("Postcode does not exist!\n" + JSON.stringify(data2, 2, 2));
      } else {
        $("#successStatus").html("Some error occurred\n" + JSON.stringify(data2, 2, 2));
      }
    }
  });
}