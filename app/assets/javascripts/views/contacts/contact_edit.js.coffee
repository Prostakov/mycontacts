class Mycontacts.Views.ContactEdit extends Backbone.View
  className: 'contact_edit'
  template: JST['contacts/edit']

  events:
  	'submit form': 'updateContact'

  render: ->
  	$(@el).html(@template(contact: @model))
  	@

  updateContact: (event) ->
    event.preventDefault()