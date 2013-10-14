class Mycontacts.Views.GroupNew extends Backbone.View
  className: 'group_new'
  template: JST['groups/new']

  events:
  	'submit form': 'createGroup'

  render: ->
  	$(@el).html(@template())
  	@

  createGroup: (event) ->
  	event.preventDefault()
  	attr = {
  	  name: @$('#group_name').val()
  	}
  	@collection.create attr,
  	  wait: true
  	  success: (model, response, options) =>
  	  	Backbone.history.navigate("groups", true)
  	  error: =>
  	  	alert "Error!"