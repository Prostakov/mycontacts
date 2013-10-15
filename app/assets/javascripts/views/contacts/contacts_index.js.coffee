class Mycontacts.Views.ContactsIndex extends Backbone.View
  className: 'contacts_container'
  template: JST['contacts/index']
  events:
    'click #create_contact': 'createContact'
    'click #show_groups': 'showGroups'
    'change select#change_group': 'groupsFilter'
    'change #search_contact': 'searchFilter'

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

  groupsFilter: ->
    id = @$('select#change_group').find(':selected').data('id')
    @$('li').show()
    return if id == 0
    @collection.each(@filterModelsViaGroups)

  filterModelsViaGroups: (model) =>
    unless model.get('group_id') == @$('select#change_group').find(':selected').data('id')
      @$("li[data-id='#{model.get('id')}']").hide()

  searchFilter: ->
    if @$('#search_contact').val().length == 0
      @groupsFilter @
      return
    @$('li').hide()
    search_results = @collection.search(@$('select#search_options').find(':selected').data('search_attr'),@$('#search_contact').val())
    for model in search_results
      li = @$("li[data-id='#{model.get('id')}']")
      li.show() unless li.is(":visible")