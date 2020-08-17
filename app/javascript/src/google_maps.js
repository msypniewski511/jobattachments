
export default function afterInitCurrentLocation(current_location) {
  //var current_position = getMeCurrentLocation();

  var tab = createForJobsMap("#{jobs_for_map}")
  //-# var job = createForJobs("#{jobs_for_map0}");
  //-# var job1 = createForJobs("#{jobs_for_map1}");

  // The location of Uluru
  var uluru = { lat: current_location.coords.latitude, lng: current_location.coords.longitude };
  // The map, centered at Uluru
  var map = new google.maps.Map(
    document.getElementById('map'), { zoom: 12, center: uluru });
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({ position: uluru, map: map });
  // var marker1 = new google.maps.Marker({position: {lat: 51.509882, lng: -0.135007}, map: map});
  //-# var marker3 = new google.maps.Marker({position: {lat: 51.451818, lng: -0.02806}, map: map});



  //-# var marker2 = new google.maps.Marker({position: {lat: parseFloat(job[1]), lng: parseFloat(job[2])}, map: map});
  //-# var info2 = createInfoWindow(`${job[0].replace('[', '').replace('"', '')}`);
  //-# google.maps.event.addListener(marker2, 'click', function(){
  //-# info2.open(map, marker2);
  //-# })

  //-# var marker4 = new google.maps.Marker({position: {lat: parseFloat(job1[1]), lng: parseFloat(job1[2])}, map: map});

  var contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
    '<h1 id="firstHeading" class="firstHeading">DOM</h1>' +
    '<div id="bodyContent">' +
    '<p></p>' +
    '<p>Attribution: Uluru, <a href="https://google.com" target="_blank">' +
    'https://en.wikipedia.org/w/index.php?title=Uluru</a> ' +
    '(last visited June 22, 2009).</p>' +
    '</div>' +
    '</div>';

  var info = createInfoWindow(contentString);
  google.maps.event.addListener(marker, 'click', function () {
    info.open(map, marker);
  });

  var markers = []
  var infos = []
  let url;
  for (let i = 0; i < tab.length; i++) {

    markers[i] = new google.maps.Marker({ position: { lat: parseFloat(createForJobsTab(tab[i])[1]), lng: parseFloat(createForJobsTab(tab[i])[2]) }, map: map });
    url = new URL(createForJobsTab(tab[i])[3].replace('&quot;', '').replace('&quot;', ''));
    contentString = '<div id="content">' +
      '<div id="siteNotice">' +
      '</div>' +
      `<h3 id="firstHeading" class="firstHeading text-primary">${createForJobsTab(tab[i])[0]}</h3>` +
      '<div id="bodyContent">' +
      '<p><a href=' + `${url}` + '>Go to adversiter</a></p>' +
      `<p>Attribution: Uluru, <a href=${url}>${createForJobsTab(tab[i])[4]}</a> ` +
      '().</p>' +
      '</div>' +
      '</div>';
    infos[i] = createInfoWindow(contentString);
    google.maps.event.addListener(markers[i], 'click', function () {
      infos[i].open(map, markers[i]);
    });
  }
}