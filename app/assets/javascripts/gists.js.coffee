# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


this.Tag = (id, name) ->
  this.id = id
  this.name = name

  return

this.Tag.all = []

this.Tag.grabAll = (callback) ->
  $.getJSON(
    "/tags",
    (data) ->
      $(data).each(() ->
        Tag.all.push(new Tag(this.id, this.name))

      )

      callback() if callback
  )

  return

this.TextSearchSelect = (element) ->
  that = this

  this.element = element
  this.input = null
  this.tags = []
  this.tagSelections = null

  this.initialize = () ->
    Tag.grabAll(that.buildTagList)

  this.buildTagList = () ->
    that.tags = Tag.all
    that.element.append("Add Tag: <input/>")
    that.input = that.element.find("input")
    that.populateTagList()
    that.element.focusin(() ->
      that.tagSelections = $("<div></div>")
                        .addClass("tagSelectionContainer")

      that.populateTagList()

      that.input.keyup(that.modifyTagList)

      that.element.append(that.tagSelections)

      that.tagSelections.on("click", ".tagSelection", () ->
        name = "gist[tag_ids][]"

        inputDiv = $("<div>" + $(this).text() + "</div>").addClass("round label")

        input = $("<input name='" + name + "'>")

        input.attr("value",  $(this).data("tagId"))
        input.attr("size", 0)
        input.attr("readonly", "true")

        inputDiv.append(input)

        $("#tagContainer").append(inputDiv)
      )
    )

    that.element.focusout(() ->
      console.log("out")
      timeoutId = window.setTimeout(() ->
        that.tagSelections.remove()
      , 200)
    )

  this.populateTagList = () ->
    that.tagSelections.empty() if that.tagSelections

    $(that.tags).each(() ->
      tag = $("<div>" + this.name + "</div>")
              .addClass("tagSelection")

      tag.data("tagId", this.id)
      that.tagSelections.append(tag) if that.tagSelections
    )


  this.modifyTagList = () ->
    regex = new RegExp(that.input.val(), "i")
    console.log(regex)
    that.tags = _.filter(Tag.all, (tg)->
      return (regex.exec(tg.name))
    )
    that.populateTagList()



  return