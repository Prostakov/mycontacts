class Mycontacts.Routers.Contacts extends Backbone.Router
  routes:
  	'': 'redirectToIndex'
  	'contacts': 'index'
  	'contacts/new': 'createContact'
  	'contacts/:id': 'showContact'
  	'contacts/:id/edit': 'editContact'

  initialize: ->
  	@collection = new Mycontacts.Collections.Contacts()

  redirectToIndex: ->
  	Backbone.history.navigate("contacts", true)

  index: ->
    @collection.fetch
      success: =>
      	view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	$('#main_container').html(view.render().el)
      error: =>
          console.log "error!"

  showContact: (id) ->
  	# Fetching collection if not already fetched
  	if @collection.length == 0
  	  @collection.fetch
        success: (new_collection, response, options) =>
      	  view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	  $('#main_container').html(view.render().el)
      	  # ExecJS::RuntimeError in Main#index
      	  #model = @collection.get(id)
          #view = new Mycontacts.Views.ContactShow(model: model)
          #$('#contacts_info').html(view.render().el)
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      view = new Mycontacts.Views.ContactShow(model: model)
      $('#contacts_info').html(view.render().el)

  createContact: ->
  	# Fetching collection if not already fetched
  	if @collection.length == 0
  	  @collection.fetch
        success: (new_collection, response, options) =>
      	  view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	  $('#main_container').html(view.render().el)
      	  # ExecJS::RuntimeError in Main#index
      	  #view = new Mycontacts.Views.ContactNew(collection: @collection)
          #$('#contacts_info').html(view.render().el)
        error: =>
          console.log "error!"
    else
      view = new Mycontacts.Views.ContactNew(collection: @collection)
      $('#contacts_info').html(view.render().el)

  editContact: (id) ->
  	# Fetching collection if not already fetched
  	if @collection.length == 0
  	  @collection.fetch
        success: (new_collection, response, options) =>
      	  view = new Mycontacts.Views.ContactsIndex(collection: @collection)
      	  $('#main_container').html(view.render().el)
      	  # ExecJS::RuntimeError in Main#index
          #model = @collection.get(id)
          #view = new Mycontacts.Views.ContactEdit(model: model, collection: @collection)
          #$('#contacts_info').html(view.render().el)
        error: =>
          console.log "error!"
    else
      model = @collection.get(id)
      view = new Mycontacts.Views.ContactEdit(model: model, collection: @collection)
      $('#contacts_info').html(view.render().el)