class Mycontacts.Views.Group extends Backbone.View
  tagName: 'li'
  template: JST['groups/group']
  events:
  	'click .edit_group': 'editGroup'
  	'click .destroy_group': 'destroyGroup'

  render: ->
  	$(@el).html(@template(group: @model))
  	this

  editGroup: ->
  	Backbone.history.navigate("groups/#{@model.get('id')}/edit", true)

  destroyGroup: ->
    console.log 'destroying...'