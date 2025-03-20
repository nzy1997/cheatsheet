#import "@preview/peace-of-posters:0.5.2" as pop
#import "@preview/cetz:0.3.4": canvas, draw
#import "qec_plot.typ": *

// #set page("a0", margin: 1cm, flipped: true)
// #set page(width: 2700pt,height:  4800pt,margin: 1cm, flipped: true)
#set page(width: 1800pt,height:  3200pt,margin: 1cm, flipped: true)

#pop.set-poster-layout(pop.layout-a0)
#pop.set-theme(pop.uni-fr)
#set text(size: pop.layout-a0.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.update-poster-layout(spacing: box-spacing)

#pop.title-box(
    "Zhongyi's Cheatsheet, 2025/03",
)

#columns(3, [
    #pop.column-box(heading: "Codes")[
#figure(canvas({
  import draw: *
  steane_code((0, 0),size: 8)
  }))
  #figure(canvas({
  import draw: *
  surface_code((0, 0), 3, 3, size :6,number_tag: true)
  surface_code_label((20,7),size: 2)
   for i in range(3){
    circle((12, i*6), radius: 0.4, fill: red, stroke: none, name: "control" + str(i))
   }
   circle((17, 0), radius: 0.4, fill: red, stroke: none, name: "control")
    content((rel: (3.3, 0), to: "control"), [Logical $Z$])
}))]

    #colbreak()

        #pop.column-box(heading: "Pauli")[
        $
            X = mat(0, 1; 1, 0), quad
            Y = mat(0, -i; i, 0), quad
            Z = mat(1, 0; 0, -1)
        $
        $
            &X Y = i Z, &quad
            &Y Z = i X, &quad
            &Z X = i Y &\ 
            &Y X = -i Z, &quad
            &Z Y = -i X, &quad
            &X Z = -i Y &
        $
        $
            &[X, Y] = 2i Z, & quad
            &[Y, Z] = 2i X, & quad
            &[Z, X] = 2i Y & \ 
            &[Y, X] = -2i Z, & quad
            &[Z, Y] = -2i X, & quad
            &[X, Z] = -2i Y &
        $
    ]

    // #pop.column-box(heading: "Another one")[
    //     We are peaceful doves.
    // ]

    #colbreak()

    #pop.column-box(heading: "Quantum channels")[
        A quantum channel: $phi in T(X,Y)$

        Kraus representation:
        $
            phi(rho) = sum_i E_i rho E_i^dagger "(CP)", quad sum_i E_i^dagger E_i = I "(TP)"
        $

        Choi isomorphism: $J: T(X,Y) arrow L(Y times.circle X)$
        $
           J(phi) = sum_(i,j) phi(|i angle.r angle.l j|) times.circle |i angle.r angle.l j|
        $
        // $quad phi(rho) = "Tr"_X (J(phi) (I_Y times.circle rho^T))$
        Definition representation: $phi(rho) = "Tr"_E(U rho U^dagger) $

        Vectorization: $K(phi)"vec"(rho) = "vec"(phi(rho))$


    ]
])

// #columns(3, [
//     #pop.column-box(heading: "Col1")[]

//     #colbreak()

//     #pop.column-box(heading: "Col2")[]

//     #colbreak()

//     #pop.column-box(heading: "Col3", stretch-to-next: true)[
//         This will be very very large!
//     ]
// ])

// #pop.bottom-box()[
//     Peace of posters:
//     https://jonaspleyer.github.io/peace-of-posters/
// ]

