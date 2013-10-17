class Mycontacts.Views.GroupEdit extends Backbone.View
  className: 'group_edit'
  template: JST['groups/edit']

  events:
  	'submit form': 'updateGroup'

  render: ->
  	$(@el).html(@template(group: @model))
  	@

  updateGroup: (event) ->
    event.preventDefault()
    attr = {
      id: @$('h1').attr('data-id')
      name: @$('#edit_group_name').val()
    }
    @model.save attr,
      url: "/api/groups/#{attr.id}"
      success: (model, response, options) =>
      	@collection.set model,
          remove: false
      	Backbone.history.navigate("contacts/groups", true)
      error: =>
      	console.log "Error!"