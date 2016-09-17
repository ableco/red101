function addField(event) {
  event.preventDefault();

  var eventTarget = $(event.target);
  var time        = new Date().getTime();
  var regexp      = new RegExp(eventTarget.data('id'), 'g');
  var content     = eventTarget.data('fields').replace(regexp, time);
  var container   = eventTarget.data('container');

  $(container).append(content);
};

$(document).on('click', '.add-fields', addField);
