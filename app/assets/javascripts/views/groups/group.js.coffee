class Mycontacts.Views.Group extends Backbone.View
  tagName: 'li'
  template: JST['groups/group']
  events:
  	'click .edit_group': 'editGroup'
  	'click .destroy_group': 'destroyGroup'

  initialize: ->
    @model.on('destroy', @removeView)

  render: ->
  	$(@el).html(@template(group: @model))
  	this

  removeView: =>
    $(@el).remove()

  editGroup: ->
  	Backbone.history.navigate("groups/#{@model.get('id')}/edit", true)

  destroyGroup: ->
    dialog = $('<div></div>').appendTo(document.body).html('<div><h4>Are you sure?</h4></div>')
    dialog.dialog
        modal: true
        draggable: false
        position: 'center top'
        top: '0'
        title: 'Delete Group'
        zIndex: 10000
        autoOpen: true
        width: '250px'
        resizable: false
        buttons:
          Yes: =>
            @collection.each(@destroyRelationsWithContacts)
            @model.destroy()
            dialog.dialog("close")
          No: ->
            dialog.dialog("close")
        close: (event, ui) ->
          $(this).remove();

  destroyRelationsWithContacts: (model) =>
    attr = { group_id: 0 }
    if model.get('group_id') == @model.get('id')
      model.save attr,
        url: "/api/contacts/#{model.get('id')}"
        success: (new_model, response, options) =>
          @collection.set model,
            remove: false
        error: =>
          console.log "Error!"