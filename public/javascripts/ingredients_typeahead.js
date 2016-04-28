var ingredients = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
    url: '/recipes/ingredients/%QUERY.json',
    wildcard: '%QUERY'
  }
});

function add_typehead(selector) {
  selector.typeahead(null, {
    name: 'ingredients',
    hint: true,
    highlight: true,
    minLength: 1,
    source: ingredients
  });
}

function add_table_row(sender) {
  var table = $($(sender).data('table'));
  var tr = table.find('tr:hidden').clone();
  tr.appendTo(table);
  tr.show();
  tr.find('input:disabled').removeAttr('disabled');
  tr.find('input:first').focus();
  add_typehead($(tr).find('.scrollable-dropdown-menu .typeahead'));
  return false;
}

function delete_table_row(sender) {
  $(sender).parent().parent().remove();
  return false;
}

function auto_add_table_row(sender, event) {
  if (event.keyCode == 9)
    add_table_row($(sender));
}

$(document).ready(function() {
  add_typehead($('.scrollable-dropdown-menu .typeahead:visible'));
});