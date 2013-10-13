class Mycontacts.Views.Contact extends Backbone.View
  tagName: 'li'
  template: JST['contacts/contact']

  initialize: ->
    @model.on('change', @render, this)

  events: ->
  	'click': 'showContact'

  render: ->
  	$(@el).html(@template(contact: @model))
  	$(@el).attr('data-id', @model.get('id'))
  	this

  showContact: ->
  	Backbone.history.navigate("contacts/#{@model.get('id')}", true)