'use strict'

$( document ).ready( () => {
  newLink()
})

var newLink = () => {
  $('#submit-link').click( (event) => {
    event.preventDefault()
    $.ajax({
       method: "POST",
       url: "api/v1/links",
       data: {
                title: linkTitle(),
                url: linkBody()
             },
       success: (data) => {
         clearLinks()
         loadLinks()
         clearForm()
       },
       error: () => {
         alertError()
       }
    })
  })
}

var linkTitle = () => {
  return $('#title-field').val()
}

var linkBody = () => {
  return $('#url-field').val()
}

var clearForm = () => {
  $('#title-field').val("")
  $('#url-field').val("")
}

var alertError = () => {
  alert("negative ghost rider")
}
