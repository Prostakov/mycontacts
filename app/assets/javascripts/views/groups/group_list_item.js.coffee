class Mycontacts.Views.GroupListItem extends Backbone.View
  tagName: 'option'
  template: JST['groups/group_list_item']

  initialize: ->
  	@model.on('change', @render, this)
  	@model.on('destroy', @remove, this)

  render: ->
    $(@el).html(@template(group: @model))
    $(@el).attr('data-id',@model.get('id'))
    this

  remove: ->
  	$(@el).remove()