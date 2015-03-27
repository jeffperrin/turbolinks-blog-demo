// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(onTurbolinksPageLoad);
$(document).ready(onFullPageRefresh);

$(document).on('page:load', onTurbolinksPageLoad);

function onTurbolinksPageLoad() {
  $('input[type=date]').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd'
  });
}

function onFullPageRefresh() {
  $(document).on('submit', 'form[method="get"]', function(e) {
    e.preventDefault();

    var form = $(e.target);
    var url = form.attr('action');
    var initialSeparator = (url.indexOf('?') == -1 ? '?' : '&');

    Turbolinks.visit(url + initialSeparator + form.serialize());
  });
}