class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
    '': 'redirectToIndex'
    'contacts': 'index'
    'contacts/new': 'createContact'
    'contacts/:id': 'showContact'
    'contacts/:id/edit': 'editContact'
    'groups/manage': 'manageGroups'
    'groups/new': 'createGroup'

  initialize: ->
    @collection = new Mycontacts.Collections.Contacts()
    @groups_collection = new Mycontacts.Collections.Groups()

  redirectToIndex: ->
    Backbone.history.navigate("contacts", true)

  index: ->
    @collection.fetch
      success: =>
        view = new Mycontacts.Views.ContactsIndex(collection: @collection)
        $('#main_container').html(view.render().el)
      error: => console.log "Error while loading contacts!"
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: => console.log "Group collection loaded!"
        error: => console.log "Error while loading data!"

  showContact: (id) ->
    # Fetching collection if not already fetched
    if @collection.length == 0
      @collection.fetch
        success: (new_collection, response, options) =>
          view = new Mycontacts.Views.ContactsIndex(collection: @collection)
          $('#main_container').html(view.render().el)
          model = @collection.get(id)
          show_contact_view = new Mycontacts.Views.ContactShow(model: model)
          $('#contacts_info').html(show_contact_view.render().el)
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      show_contact_view = new Mycontacts.Views.ContactShow(model: model)
      $('#contacts_info').html(show_contact_view.render().el)
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: => console.log "Group collection loaded!"
        error: => console.log "Error while loading data!"

  createContact: ->
    # Fetching collection if not already fetched
    if @collection.length == 0
      @collection.fetch
        success: (new_collection, response, options) =>
          view = new Mycontacts.Views.ContactsIndex(collection: @collection)
          $('#main_container').html(view.render().el)
          new_contact_view = new Mycontacts.Views.ContactNew(collection: @collection)
          $('#contacts_info').html(new_contact_view.render().el)
        error: =>
          console.log "error!"
    else
      new_contact_view = new Mycontacts.Views.ContactNew(collection: @collection)
      $('#contacts_info').html(new_contact_view.render().el)
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: => console.log "Group collection loaded!"
        error: => console.log "Error while loading data!"

  editContact: (id) ->
    # Fetching collection if not already fetched
    if @collection.length == 0
      @collection.fetch
        success: (new_collection, response, options) =>
          view = new Mycontacts.Views.ContactsIndex(collection: @collection)
          $('#main_container').html(view.render().el)
          model = @collection.get(id)
          edit_contact_view = new Mycontacts.Views.ContactEdit(model: model, collection: @collection)
          $('#contacts_info').html(edit_contact_view.render().el)
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      edit_contact_view = new Mycontacts.Views.ContactEdit(model: model, collection: @collection)
      $('#contacts_info').html(edit_contact_view.render().el)
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: => console.log "Group collection loaded!"
        error: => console.log "Error while loading data!"

  manageGroups: ->
    # Fetching collection if not already fetched
    if @collection.length == 0
      @collection.fetch
        success: (new_collection, response, options) =>
          view = new Mycontacts.Views.ContactsIndex(collection: @collection)
          $('#main_container').html(view.render().el)
        error: =>
          console.log "error!"
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: => 
          console.log "Group collection loaded!"
          view = new Mycontacts.Views.GroupsIndex(collection: @groups_collection)
          view.render().el
          manage_groups_view = new Mycontacts.Views.GroupsManage(collection: @groups_collection)
          $('#contacts_info').html(manage_groups_view.render().el)
        error: => console.log "Error while loading data!"
    else
      view = new Mycontacts.Views.GroupsIndex(collection: @groups_collection)
      $('#contacts_info').html(view.render().el)

  createGroup: ->
    console.log "Group creating..."