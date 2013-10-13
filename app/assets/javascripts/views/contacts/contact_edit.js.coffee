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
    attr = {
      id: @$('h1').attr('data-id')
      first_name: @$('#edit_contact_first_name').val()
      middle_name: @$('#edit_contact_middle_name').val()
      last_name: @$('#edit_contact_last_name').val()
      phone: @$('#edit_contact_phone').val()
      email: @$('#edit_contact_email').val()
    }
    @model.save attr,
      url: "/api/contacts/#{attr.id}"
      success: (model, response, options) =>
      	@collection.set model,
          remove: false
      	Backbone.history.navigate("contacts/#{model.get('id')}", true)
      error: =>
      	console.log "Error!"