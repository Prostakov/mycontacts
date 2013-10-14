class Mycontacts.Views.GroupsIndex extends Backbone.View
  className: 'groups_show'
  template: JST['groups/index']

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendGroup, this)
  	this

  appendGroup: (group) ->
    view = new Mycontacts.Views.Group(model: group)
    @$('ul').append(view.render().el)