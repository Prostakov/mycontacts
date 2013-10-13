class Mycontacts.Views.ContactNew extends Backbone.View
  className: 'contact_new'
  template: JST['contacts/new']

  events:
  	'submit form': 'createContact'

  render: ->
  	$(@el).html(@template())
  	@

  createContact: (event) ->
  	event.preventDefault()
  	attr = {
  	  first_name: @$('#new_contact_first_name').val()
  	  middle_name: @$('#new_contact_middle_name').val()
  	  last_name: @$('#new_contact_last_name').val()
  	  phone: @$('#new_contact_phone').val()
  	  email: @$('#new_contact_email').val()
  	}
  	@collection.create attr,
  	  wait: true
  	  success: (model, response, options) =>
  	  	Backbone.history.navigate("contacts/#{model.get('id')}", true)
  	  error: =>
  	  	alert "Error!"