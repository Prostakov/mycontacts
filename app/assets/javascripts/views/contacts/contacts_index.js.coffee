class Mycontacts.Views.ContactsIndex extends Backbone.View
  className: 'contacts_container'
  template: JST['contacts/index']
  events:
    'click #create_contact': 'createContact'
    'click #show_groups': 'showGroups'

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

  createContact: ->
    Backbone.history.navigate("contacts/new", true)

  showGroups: ->
    Backbone.history.navigate("groups", true)