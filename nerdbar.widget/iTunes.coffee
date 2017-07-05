command: "sh scripts/itunes.sh"

refreshFrequency: 1000 # ms

render: (output) ->
  """
    <link rel="stylesheet" type="text/css" href="./colors.css" />
  """

style: """
  left: 12px
  bottom: 11px
  color: #fff
  height: 13
"""

render: (output) -> """
 <span class='playing'><span class='icon blue'> &nbsp</span></span><span class='white'>#{output}</span>
"""