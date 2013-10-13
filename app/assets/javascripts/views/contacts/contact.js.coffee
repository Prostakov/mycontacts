class Mycontacts.Views.Contact extends Backbone.View
  tagName: 'li'
  template: JST['contacts/contact']

  events: ->
  	'click': 'showContact'

  render: ->
  	$(@el).html(@template(contact: @model))
  	@

  showContact: ->
  	console.log @model.get('id')