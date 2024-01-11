import
  macros,
  strutils


proc emitJs*(code: string): NimNode {.compileTime.} =
  newNimNode(nnkPragma).add(
    newNimNode(nnkExprColonExpr).add(
      ident"emit",
      newLit(code.replace("`", "``"))
    )
  )


when not defined(no_i_tlwnd):
  const
    tlwndv {.strdefine.} = ""
    tlwnd_plugins {.strdefine.} = ""

  proc fetchFromUrl(url: string): string {.compileTime.} =
    let data = gorgeEx("curl -N -s -L " & url)
    return data.output
  
  macro fetch() =
    if tlwnd_plugins != "":
      emitJs(fetchFromUrl("https://cdn.tailwindcss.com/" & tlwndv & "?plugins=" & tlwnd_plugins))
    else:
      emitJs(fetchFromUrl("https://cdn.tailwindcss.com/" & tlwndv))

  fetch()
