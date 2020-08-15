
(function () {
  window.App = {}
  App.GoogleMap = (function () {
    GoogleMap.prototype.map_div = {};

    GoogleMap.prototype.map = {};

    function GoogleMap(map_div) {
      this.map_div = map_div;
      this.init_map();
      this.reference_the_map_as_data_attribute;
    }

    GoogleMap.prototype.reference_the_map_as_data_attribute = function () {
      this.map_div.data('GoogleMap', this);
      return this.map_div.data('map', this.map);
    };

    GoogleMap.prototype.init_map = function () {
      if (typeof google !== "undefined" && google !== null) {
        return this.map = new google.maps.Map(this.dom_element, this.map_configuration);
      }
    };

    GoogleMap.prototype.dom_element = function () {
      return this.map_div.get(0);
    };

    GoogleMap.prototype.map_configuration = function () {
      return {
        scrollWheel: true
      };
    };

    return GoogleMap;

  })();

}).call(this);