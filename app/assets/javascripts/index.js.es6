'use strict'

$(document).ready( () => {
  loadLinks()
})

var renderLinks = (link) => {
  $('#links').prepend(
    `<div id='link'>
     <h3 id='title' link-id='${link.id}' tile=${link.title}>
     ${link.title}
     </h3><p id='url' link-id=${link.id} ><a href='${link.url}'>${link.url}</a>
     </p>
     <p>
     Status: ${readOrNot(link.read)}
     </p>
     <hr>
     </div>`
  )
}

var readOrNot = (arg) => {
  if (arg === false) {
    return "Not Read"
  } else {
    return "Read"
  }
}

var enumLinks = () => {
  $.getJSON( "api/v1/links", function( data ) {
      data.sort(function(a, b) {return a.id - b.id}).forEach( (link) => {
        renderLinks(link)
    })
  })
}

var sorterFlag = true

var loadLinks = (event) => {
  $.getJSON('api/v1/links')
    .then(enumLinks())
  	.fail((data) => { alert('Something Went Wrong!') })
}

var clearLinks = () => {
  $('#links').children().remove()
}
