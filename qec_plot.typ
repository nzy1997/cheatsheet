#import "@preview/cetz:0.3.4": canvas,draw


#let steane_code(loc,size:4, color1:yellow, color2:aqua,color3:olive) = {
  import draw: *
  let x = loc.at(0) 
  let y = loc.at(1)
  circle((x,y), name: "q7", radius: 0.03 * size, fill: black, stroke: none)
  circle((x,y + size), name: "q4",  radius: 0.03 * size, fill: black, stroke: none)
  circle((x,y - size/2), name: "q2",  radius: 0.03 * size, fill: black, stroke: none)
  circle((x + calc.sqrt(3)*size/4,y + size/4), name: "q6", radius: 0.03 * size, fill: black, stroke: none)
  circle((x - calc.sqrt(3)*size/4,y + size/4), name: "q5",  radius: 0.03 * size, fill: black, stroke: none)
  circle((x + calc.sqrt(3)*size/2,y  - size/2), name: "q3",  radius: 0.03 * size, fill: black, stroke: none)
  circle((x - calc.sqrt(3)*size/2,y  - size/2), name: "q1",  radius: 0.03 * size, fill: black, stroke: none)

  let xb = 0.1*size
  let yb = 0.1*size


  line("q1", "q2","q7","q5","q1", fill: color1,close: true, stroke: black)
  line("q2", "q3","q6","q7","q2", fill: color2,close: true, stroke: black)
  line("q4", "q5","q7","q6","q4", fill: color3,close: true, stroke: black)

  circle("q1", radius: 0.03 * size, fill: black, stroke: none)
  circle("q2", radius: 0.03 * size, fill: black, stroke: none)
  circle("q3", radius: 0.03 * size, fill: black, stroke: none)
  circle("q4", radius: 0.03 * size, fill: black, stroke: none)
  circle("q5", radius: 0.03 * size, fill: black, stroke: none)
  circle("q6", radius: 0.03 * size, fill: black, stroke: none)
  circle("q7", radius: 0.03 * size, fill: black, stroke: none)

  content((rel: (0, yb), to: "q1"), [$1$])
  content((rel: (-xb, yb), to: "q2"), [$2$])
  content((rel: (0, yb), to: "q3"), [$3$])
  content((rel: (0, yb), to: "q4"), [$4$])
  content((rel: (0, yb), to: "q5"), [$5$])
  content((rel: (0, yb), to: "q6"), [$6$])
  content((rel: (0, yb), to: "q7"), [$7$])
}

#let surface_code(loc, m, n, size:1, color1:yellow, color2:aqua,number_tag:false,type_tag:true) = {
  import draw: *
  for i in range(m){
    for j in range(n){
      let x = loc.at(0) + i * size
      let y = loc.at(1) + j * size
      if (i != m - 1) and (j != n - 1){
        if (calc.rem(i + j, 2) == 0){
          if type_tag{
           if (i == 0){
            bezier((x, y), (x, y + size), (x - size * 0.7, y + size/2), fill: color2, stroke: black)
          }
          if (i == m - 2){
            bezier((x + size, y), (x + size, y + size), (x + size * 1.7, y + size/2), fill: color2, stroke: black)
          }
          }else{
                      if (j == 0){
            bezier((x, y), (x + size, y), (x + size/2, y - size * 0.7), fill: color2, stroke: black)
          }
          if (j == n - 2){
            bezier((x, y + size), (x + size, y + size), (x + size/2, y + size * 1.7), fill: color2, stroke: black)
          }
          }
          rect((x, y), (x + size, y + size), fill: color1, stroke: black)
        } else {
                if type_tag{
          if (j == 0){
            bezier((x, y), (x + size, y), (x + size/2, y - size * 0.7), fill: color1, stroke: black)
          }
          if (j == n - 2){
            bezier((x, y + size), (x + size, y + size), (x + size/2, y + size * 1.7), fill: color1, stroke: black)
          }
            }else{
               if (i == 0){
            bezier((x, y), (x, y + size), (x - size * 0.7, y + size/2), fill: color1, stroke: black)
          }
          if (i == m - 2){
            bezier((x + size, y), (x + size, y + size), (x + size * 1.7, y + size/2), fill: color1, stroke: black)
          }
            }
          rect((x, y), (x + size, y + size), fill: color2, stroke: black)
        }
      }
      circle((x, y), radius: 0.08 * size, fill: black, stroke: none)
      if number_tag{
      content((x + 0.1*size, y - 0.1*size), [#(i+(n - j - 1)*m+1)])
    }
    }
  }
}
#let surface_code_label(loc,size:1,color1:yellow, color2:aqua) = {
  import draw: *
  let x = loc.at(0)
  let y = loc.at(1)
  content((x, y), box(stroke: black, inset: 10pt, [$X$ stabilizers],fill: color2, radius: 4pt))
  content((x, y - 1.5*size), box(stroke: black, inset: 10pt, [$Z$ stabilizers],fill: color1, radius: 4pt))
}
