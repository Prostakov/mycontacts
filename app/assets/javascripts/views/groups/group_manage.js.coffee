class Mycontacts.Views.GroupManage extends Backbone.View
  tagName: 'li'
  template: JST['groups/manage_item']

  render: ->
  	$(@el).html(@template())
  	this