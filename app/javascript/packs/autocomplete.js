import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const renderItem = function (item) {
    let icon;
    if (item.type === 'user') {
      icon = '<i class="fab fa-github"></i>';
    } else if (item.type === 'city  ') {
      icon = '<i class="fas fa-code"></i>';
    }
    return `<div class="autocomplete-suggestion">${icon}<span>${item.name}</span></div>`
};

const autocompleteSearch = function() {
  const cities = JSON.parse(document.getElementById('search-data').dataset.cities)
  const searchInput = document.getElementById('q');

  if (cities && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
        $.getJSON('/autocomplete',
          { q: term },
          function(data) {
            return data;
        }).then((data) => {
          const matches = []
          data.cities.forEach((cities) => {
            matches.push({type: 'cities', name: cities });
          });
          suggest(matches)
        });
      },
      renderItem: renderItem,
    });
  }
};

export { autocompleteSearch };