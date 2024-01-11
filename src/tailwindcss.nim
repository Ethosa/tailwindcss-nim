## # Highlight.js
## 
## [highlight.js](https://highlightjs.org/) for Nim
## 
when not defined(js):
  {.error: "This library works only with JS backend".}


import
  dom,
  jsffi,
  json

import tailwindcss/private/fetch_lib


type TailwindCssObj* = JsObject


var tailwind* {.importc, nodecl.}: TailwindCssObj


macro configure*(self: TailwindCssObj, config: static[JsonNode]) =
  emitJs("tailwind.config = " & $config & ";")
