class Mycontacts.Collections.Contacts extends Backbone.Collection
  url: '/api/contacts'
  model: Mycontacts.Models.Contact

  search: (attribute, value) ->
    return @filter (model) ->
      #value.indexOf(model.get(attribute)) != -1
      model.get(attribute) == value