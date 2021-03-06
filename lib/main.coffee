root = document.documentElement

module.exports =
  activate: (state) ->
    atom.config.observe 'one-light-small-tabs-ui.fontSize', (value) ->
      setFontSize(value)

    atom.config.observe 'one-light-small-tabs-ui.layoutMode', (value) ->
      setLayoutMode(value)

    atom.config.observe 'one-light-small-tabs-ui.tabSizing', (value) ->
      setTabSizing(value)

  deactivate: ->
    unsetFontSize()
    unsetLayoutMode()
    unsetTabSizing()

# Font Size -----------------------
setFontSize = (currentFontSize) ->
  if Number.isInteger(currentFontSize)
    root.style.fontSize = "#{currentFontSize}px"
  else if currentFontSize is 'Auto'
    unsetFontSize()

unsetFontSize = ->
  root.style.fontSize = ''

# Layout Mode -----------------------
setLayoutMode = (layoutMode) ->
  root.setAttribute('theme-one-light-small-tabs-ui-layoutmode', layoutMode.toLowerCase())

unsetLayoutMode = ->
  root.removeAttribute('theme-one-light-small-tabs-ui-layoutmode')

# Tab Sizing -----------------------
setTabSizing = (tabSizing) ->
  root.setAttribute('theme-one-light-small-tabs-ui-tabsizing', tabSizing.toLowerCase())

unsetTabSizing = ->
  root.removeAttribute('theme-one-light-small-tabs-ui-tabsizing')
