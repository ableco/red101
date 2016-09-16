function addField(event) {
  event.preventDefault();
  var eventTarget = $(event.target);
  var time = new Date().getTime();
  var regexp = new RegExp(eventTarget.data('id'), 'g');
  var content = eventTarget.data('fields').replace(regexp, time);
  var targetContainer = eventTarget.data('targetContainer');

  $(targetContainer).append(content);
};

$(document).on('click', '.add-fields', addField);
