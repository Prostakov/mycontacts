class Mycontacts.Views.GroupsIndex extends Backbone.View
  el: '#change_group'

  render: ->
    @collection.each(@appendGroup, this)
    this

  appendGroup: (group) ->
    view = new Mycontacts.Views.Group(model: group)
    $(@el).append(view.render().el)