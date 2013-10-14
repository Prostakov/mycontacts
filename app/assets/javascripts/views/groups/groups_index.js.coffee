class Mycontacts.Views.GroupsIndex extends Backbone.View
  className: 'groups_container'
  template: JST['groups/index']

  render: ->
    $(@el).html(@template())
    this