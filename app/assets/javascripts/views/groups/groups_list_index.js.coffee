class Mycontacts.Views.GroupsListIndex extends Backbone.View
  el: '#change_group'

  initialize: ->
    @collection.on('add', @appendGroup, this)

  render: ->
    @collection.each(@appendGroup, this)
    this

  appendGroup: (group) ->
    view = new Mycontacts.Views.GroupListItem(model: group)
    $(@el).append(view.render().el)