class Mycontacts.Views.GroupsManage extends Backbone.View
  className: 'groups_manage'
  template: JST['groups/manage']

  render: ->
  	$(@el).html(@template())
  	@collection.each(@appendGroup, this)
  	this

  appendGroup: (group) ->
    view = new Mycontacts.Views.GroupManage(model: group)
    $(@el).append(view.render().el)