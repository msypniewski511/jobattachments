
let map;
let infos = [];
export let on_map_divs = [], map_markers = [];

function createInfoWindow(text) {
  var infowindow = new google.maps.InfoWindow({ content: text });
  return infowindow;
}
export default function googleMap() {


  let current_location = $('#current_location').data('url');
  let markers = $('#markers').data('api');
  let activ_on_int_marker;
  let int_markers = []

  let uluru = { lat: current_location[0], lng: current_location[1] } || { lat: 51.5290021, lng: -0.0000000 }

  let map_style = {
    style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
    position: google.maps.ControlPosition.BOTTOM_CENTER
  }

  map = new google.maps.Map(
    document.getElementById('map'), {
    zoom: 10,
    center: uluru,
    disableDefaultUI: true,
    zoomControl: true,
    zoomControlOptions: map_style,
    scaleControl: true,
    scaleControlOptions: map_style,
    streetViewControl: true,
    rotateControl: true,
    fullscreenControl: true,
    fullscreenControlOptions: map_style,
  });

  let marker;

  for (let i = 0; i < markers.length; i++) {

    marker = JSON.parse(markers[i])
    let mark_iterator = marker.id;
    (i == 0) ? activ_on_int_marker = mark_iterator : true

    on_map_divs[mark_iterator] = document.getElementById(mark_iterator)
    i === 0 ? on_map_divs[mark_iterator].classList.add('active') : funa()

    var activeChapterName = activ_on_int_marker;

    on_map_divs[mark_iterator].addEventListener('click', () => {

    })
    map_markers[mark_iterator] = new google.maps.Marker({
      id: `marker-${mark_iterator}`,
      position: { lat: parseFloat(marker.lat), lng: parseFloat(marker.lng) },
      map: map
    });



    infos[mark_iterator] = createInfoWindow(marker.info);
    if (i === 0) setActiveChapter(mark_iterator, false);
    // google.maps.event.addListener(map_markers[mark_iterator], 'click', function () {
    //   infos[mark_iterator].open(map, map_markers[mark_iterator]);

    // })
    google.maps.event.addListener(map_markers[mark_iterator], 'mouseover', () => {
      infos[mark_iterator].open(map, map_markers[mark_iterator]);
      highlight(mark_iterator)
    })
    google.maps.event.addListener(map_markers[mark_iterator], 'mousout', () => {
      infos[mark_iterator].close(map, map_markers[mark_iterator]);
      highlight(mark_iterator)
    })
  }






  const highlight = (mark_iterator) => {
    // on_map_divs[mark_iterator].classList.toggle('inactive'); // OK
  }

  // On every scroll event, check which element is on screen
  window.document.getElementById('moje-info-sidebar').onscroll = function () {
    var chapterNames = Object.keys(map_markers);
    // console.log(chapterNames)
    for (var i = 0; i < chapterNames.length; i++) {
      var chapterName = chapterNames[i];
      // console.log(chapterName)
      if (isElementOnScreen(chapterName)) {
        setActiveChapter(chapterName);
        break;
      }
    }
  };



  function setActiveChapter(chapterName, mapInit = true) {
    if (chapterName === activeChapterName && mapInit) {
      // alert('juz jest');
      return;
    }

    // map.flyTo(chapters[chapterName]);
    // map.setCenter(getPosition());
    console.log(map_markers[chapterName].position)
    map_markers[chapterName].anchorPoint && map.setCenter(map_markers[chapterName].position);

    infos[chapterName].open(map, map_markers[chapterName]);
    infos[activeChapterName].close(map, map_markers[activeChapterName]);
    // console.log(map_markers[chapterName])
    document.getElementById(chapterName).classList.add('active');
    document.getElementById(activeChapterName).classList.remove('active');

    activeChapterName = chapterName;
  }

  function isElementOnScreen(id) {
    var element = document.getElementById(id);
    var bounds = element.getBoundingClientRect();
    var realbot = document.getElementById('moje-info-sidebar').getBoundingClientRect();
    // console.log(element)
    // console.log(window)
    // console.log(window.innerHeight)
    // console.log(realbot)

    // console.log(bounds.top)
    // console.log(bounds.bottom)

    return bounds.top < (window.innerHeight - 700) && bounds.bottom > 765;
  }
}

const funa = () => { }