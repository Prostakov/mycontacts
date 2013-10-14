class Mycontacts.Views.ContactShow extends Backbone.View
  className: 'contact_show'
  template: JST['contacts/show']

  events:
    'click button.edit': 'editContact'
    'click button.delete': 'destroyContact'
    'change select.contact_group': 'changeGroup'

  initialize: ->
    @model.on('destroy', @removeView)

  render: ->
    $(@el).html(@template(contact: @model))
    @options.groups_collection.each(@appendOptionsForGroup, this)
    @$("select.contact_group>option[data-id='#{@model.get('group_id')}']").attr('selected','selected')
    this

  changeGroup: ->
    id = @$('select.contact_group').find(':selected').data('id')
    # Updating model and collection with new group
    attr = { group_id: id }
    @model.save attr,
      url: "/api/contacts/#{@model.get('id')}"
      success: (model, response, options) =>
        @collection.set model,
          remove: false
      error: =>
        console.log "Error!"

  appendOptionsForGroup: (group) ->
    view = new Mycontacts.Views.GroupListItem(model: group)
    @$('select.contact_group').append(view.render().el)

  editContact: ->
    Backbone.history.navigate("contacts/#{@model.get('id')}/edit", true)

  destroyContact: ->
    dialog = $('<div></div>').appendTo(document.body).html('<div><h4>Are you sure?</h4></div>')
    dialog.dialog
        modal: true
        draggable: false
        position: 'center top'
        top: '0'
        title: 'Delete Contact'
        zIndex: 10000
        autoOpen: true
        width: '250px'
        resizable: false
        buttons:
          Yes: =>
            @model.destroy()
            dialog.dialog("close")
          No: ->
            dialog.dialog("close")
        close: (event, ui) ->
          $(this).remove();

  removeView: =>
    $(@el).remove()