class Mycontacts.Views.GroupsIndex extends Backbone.View
  className: 'groups_show'
  template: JST['groups/index']
  events:
  	'click button.create_group': 'createGroup'

  render: ->
  	$(@el).html(@template())
  	@options.groups_collection.each(@appendGroup, this)
  	this

  appendGroup: (group) ->
    view = new Mycontacts.Views.Group(collection: @collection, model: group)
    @$('ul').append(view.render().el)

  createGroup: ->
  	Backbone.history.navigate("contacts/groups/new", true)