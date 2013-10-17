class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
    '': 'redirectToIndex'
    'contacts': 'index'
    'contacts/new': 'createContact'
    'contacts/groups': 'showGroups'
    'contacts/groups/new': 'createGroup'
    'contacts/groups/:id/edit': 'editGroup'
    'contacts/:id': 'showContact'
    'contacts/:id/edit': 'editContact'

  initialize: ->
    @collection = new Mycontacts.Collections.Contacts()
    @groupsCollection = new Mycontacts.Collections.Groups()
    @collection.fetch
      success: =>
        @groupsCollection.fetch
          success: =>
            Backbone.history.start()

  redirectToIndex: ->
    Backbone.history.navigate("contacts", true)

  index: ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()        

  showContact: (id) ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering show action for a contact
    model = @collection.get(id)
    show_contact_view = new Mycontacts.Views.ContactShow
      model: model
      collection: @collection
      groups_collection: @groupsCollection
    $('#contacts_info').html(show_contact_view.render().el)

  createContact: ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering create action for a contact
    new_contact_view = new Mycontacts.Views.ContactNew(collection: @collection)
    $('#contacts_info').html(new_contact_view.render().el)

  editContact: (id) ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering edit action for a contact
    model = @collection.get(id)
    edit_contact_view = new Mycontacts.Views.ContactEdit(model: model, collection: @collection)
    $('#contacts_info').html(edit_contact_view.render().el) 

  showGroups: ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering index action for groups
    groups_index_view = new Mycontacts.Views.GroupsIndex
      collection: @collection
      groups_collection: @groupsCollection
    $('#contacts_info').html(groups_index_view.render().el)

  editGroup: (id) ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering edit action for group
    model = @groupsCollection.get(id)
    edit_group_view = new Mycontacts.Views.GroupEdit(model: model, collection: @groupsCollection)
    $('#contacts_info').html(edit_group_view.render().el)
 
  createGroup: ->
    # Rendering contacts index
    view = new Mycontacts.Views.ContactsIndex(collection: @collection)
    $('#main_container').html(view.render().el)
    # Rendering list of groups
    groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groupsCollection)
    groups_list_view.render()
    # Rendering create action for groups
    new_group_view = new Mycontacts.Views.GroupNew(collection: @groupsCollection)
    $('#contacts_info').html(new_group_view.render().el)