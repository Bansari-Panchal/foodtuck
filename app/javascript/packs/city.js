var cities= new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        url: '/search_city/%QUERY',
        wildcard: '%QUERY',
        cache: false
    }
});$(document).ready(function(){
  
    $('.typeahead').typeahead(null, {
        name: 'city',
        display: 'city_name',
        source: cities
       });
      });