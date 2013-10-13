class Mycontacts.Views.ContactShow extends Backbone.View
  className: 'contact_show'
  template: JST['contacts/show']

  render: ->
  	$(@el).html(@template(contact: @model))
  	@