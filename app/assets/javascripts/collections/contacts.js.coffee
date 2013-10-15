class Mycontacts.Collections.Contacts extends Backbone.Collection
  url: '/api/contacts'
  model: Mycontacts.Models.Contact

  search: (attribute, value) ->
    return @filter (model) ->
      model.get(attribute).toLowerCase() == value.toLowerCase()
      #value.indexOf(model.get(attribute)) != -1