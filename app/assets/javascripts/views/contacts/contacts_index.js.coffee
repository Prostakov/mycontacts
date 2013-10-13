class Mycontacts.Views.ContactsIndex extends Backbone.View
  className: 'contacts_container'
  template: JST['contacts/index']

  initialize: ->
    @collection.on('add', @appendContact)
    @collection.on('remove', @removeContact)

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendContact)
  	@

  appendContact: (contact) =>
  	view = new Mycontacts.Views.Contact(model: contact)
  	@$('#contacts_list').append(view.render().el)

  removeContact: (contact) =>
    id = contact.get('id')
    @$("li[data-id='#{id}']").remove()