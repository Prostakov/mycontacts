window.Mycontacts =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new Mycontacts.Routers.Contacts()

$(document).ready ->
  notice_paragraph = $('p.notice')
  alert_paragraph = $('p.alert')
  unless notice_paragraph.text().length == 0
    notice_paragraph.hide()
    notice_paragraph.show()
  unless alert_paragraph.text().length == 0
    alert_paragraph.hide()
    alert_paragraph.show()
  Mycontacts.initialize()# unless $('#main').length == 0
