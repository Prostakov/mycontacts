class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
    '': 'redirectToIndex'
    'contacts': 'index'
    'contacts/new': 'createContact'
    'contacts/:id': 'showContact'
    'contacts/:id/edit': 'editContact'
    'groups/:id/edit': 'editGroup'
    'groups/new': 'createGroup'
    'groups': 'showGroups'

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
        success: =>
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()        
        error: => console.log "Error while loading data!"

  showContact: (id) ->
    if @groups_collection.length == 0
      @groups_collection.fetch
        success: =>
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()
        error: => console.log "Error while loading data!"
    # Fetching collection if not already fetched
    if @collection.length == 0
      @collection.fetch
        success: (new_collection, response, options) =>
          view = new Mycontacts.Views.ContactsIndex(collection: @collection)
          $('#main_container').html(view.render().el)
          model = @collection.get(id)
          show_contact_view = new Mycontacts.Views.ContactShow
            model: model
            collection: @collection
            groups_collection: @groups_collection
          $('#contacts_info').html(show_contact_view.render().el)
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      show_contact_view = new Mycontacts.Views.ContactShow
        model: model
        collection: @collection
        groups_collection: @groups_collection
      $('#contacts_info').html(show_contact_view.render().el)

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
        success: =>
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()
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
        success: =>
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()  
        error: => console.log "Error while loading data!"

  showGroups: ->
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
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()
          groups_index_view = new Mycontacts.Views.GroupsIndex
            collection: @collection
            groups_collection: @groups_collection
          $('#contacts_info').html(groups_index_view.render().el)
        error: => console.log "Error while loading data!"
    else
      groups_index_view = new Mycontacts.Views.GroupsIndex
        collection: @collection
        groups_collection: @groups_collection
      $('#contacts_info').html(groups_index_view.render().el)

  editGroup: (id) ->
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
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()
          model = @groups_collection.get(id)
          edit_group_view = new Mycontacts.Views.GroupEdit(model: model, collection: @groups_collection)
          $('#contacts_info').html(edit_group_view.render().el)
        error: => console.log "Error while loading data!"
    else
      model = @groups_collection.get(id)
      edit_group_view = new Mycontacts.Views.GroupEdit(model: model, collection: @groups_collection)
      $('#contacts_info').html(edit_group_view.render().el)

  createGroup: ->
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
          groups_list_view = new Mycontacts.Views.GroupsListIndex(collection: @groups_collection)
          groups_list_view.render()
          new_group_view = new Mycontacts.Views.GroupNew(collection: @groups_collection)
          $('#contacts_info').html(new_group_view.render().el)
        error: => console.log "Error while loading data!"
    else
      new_group_view = new Mycontacts.Views.GroupNew(collection: @groups_collection)
      $('#contacts_info').html(new_group_view.render().el)