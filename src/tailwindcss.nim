## # Tailwind CSS
## 
## [Tailwind CSS](https://tailwindcss.com/) for Nim
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
  ## Changes tailwind configuration
  ## 
  ## ### Example
  ## 
  ## ```nim
  ## tailwind.configure(%*{
  ##   "theme": {
  ##     "extend": {
  ##       "colors": {
  ##         "clifford": "#da373d",
  ##       }
  ##     }
  ##   }
  ## })
  ## ```
  emitJs("tailwind.config = " & $config & ";")
