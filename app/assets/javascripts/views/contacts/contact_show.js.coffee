class Mycontacts.Views.ContactShow extends Backbone.View
  className: 'contact_show'
  template: JST['contacts/show']

  events:
  	'click button.edit': 'editContact'
  	'click button.delete': 'destroyContact'

  initialize: ->
  	@model.on('destroy', @removeView)

  render: ->
  	$(@el).html(@template(contact: @model))
  	@

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