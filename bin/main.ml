open Tyxml.Html

type project = {
  name : string;
  github_url : string;
  image_url : string;
  image_alt : string;
  stack : string;
}

let projects =
  [
    {
      name = "MNIST Digit AI";
      github_url = "https://github.com/anthonyceponis/digit-ai";
      image_url = "static/mnist.png";
      image_alt = "Nueral network of digit classification.";
      stack = "(python, flask, typescript, next.js)";
    };
    {
      name = "X86 Assembly Monopong";
      github_url = "https://github.com/anthonyceponis/x86_64-monopong";
      image_url = "static/monopong-preview.gif";
      image_alt = "Ball bouncing inside a circle.";
      stack = "(take a wild guess)";
    };
    {
      name = "Lagrangian Fluid Simulator";
      github_url = "https://github.com/anthonyceponis/pbd-fluid-sim";
      image_url = "static/pbd-fluid.png";
      image_alt = "Bunny inside a particle bath.";
      stack = "(c++, opengl, cuda)";
    };
    {
      name = "Ancient GPS";
      github_url = "https://github.com/anthonyceponis/ancient-gps";
      image_url = "static/ancient-gps.png";
      image_alt =
        "Randomly generated maze with shortest path between Theseus and the \
         Minotaur.";
      stack = "(typescript, react)";
    };
    {
      name = "Sorting Visualisers";
      github_url =
        "https://github.com/anthonyceponis/sorting-algorithms-visualiser";
      image_url = "static/sorting-vis.png";
      image_alt = "Bars with random heights, ready to be sorted.";
      stack = "(javascript, react)";
    };
    {
      name = "This website";
      github_url = "https://github.com/anthonyceponis/personal-website";
      image_url = "static/personal-website.png";
      image_alt = "A screenshot of this website's homepage";
      stack = "(ocaml, tyxml, tailwindcss)";
    };
  ]

let anim_delay_class n = Printf.sprintf "anim-delay-%d" n

(* Note that for some stupid reason, tailwind media queries just do not work. *)
let render_project i project =
  div
    ~a:
      [
        a_class
          [
            "responsive-grid";
            "w-full";
            "border";
            "rounded";
            "text-center";
            "fade-in-from-above";
            (if i > 0 then anim_delay_class i else "");
          ];
      ]
    [
      div
        [
          a
            ~a:[ a_href project.github_url; a_target "_blank" ]
            [ img ~src:project.image_url ~alt:project.image_alt () ];
        ];
      div
        ~a:
          [
            a_class
              [ "flex"; "flex-col"; "justify-center"; "items-center"; "p-5" ];
          ]
        [
          h3 ~a:[ a_class [ "text-2xl"; "font-semibold" ] ] [ txt project.name ];
          p [ txt project.stack ];
        ];
    ]

let render_projects projects =
  div
    ~a:[ a_class [ "flex"; "flex-col"; "gap-5"; "items-center"; "p-5" ] ]
    ([
       div
         ~a:[ a_class [ "text-center"; "fade-in-from-above" ] ]
         [
           h2
             ~a:[ a_class [ "text-4xl"; "font-semibold" ] ]
             [ txt "Personal Projects" ];
           p [ txt "(click images for github, most recent first)" ];
         ];
     ]
    @ List.mapi render_project projects)

let page_content () =
  html
    (head
       (title (txt "Anthony Ceponis"))
       [
         meta ~a:[ a_charset "UTF-8" ] ();
         meta
           ~a:
             [
               a_name "viewport";
               a_content "width=device-width, initial-scale=1.0";
             ]
           ();
         link ~rel:[ `Stylesheet ] ~href:"/static/tailwind.css" ();
         link ~rel:[ `Stylesheet ] ~href:"/static/styles.css" ();
         script ~a:[ a_src "/static/script.js" ] (txt "");
       ])
    (body
       ~a:[ a_class [ "font-sans" ] ]
       [
         div
           ~a:
             [
               a_class
                 [
                   "max-w-7xl"; "mx-auto"; "flex"; "flex-col"; "gap-56"; "pb-56";
                 ];
             ]
           [
             (* Main introduction section *)
             div
               ~a:
                 [
                   a_class
                     [ "flex"; "h-screen"; "items-center"; "justify-center" ];
                 ]
               [
                 div
                   ~a:[ a_class [ "text-center" ] ]
                   [
                     h3
                       ~a:
                         [
                           a_class
                             [
                               "text-2xl"; "font-semi-bold"; "fade-in-from-left";
                             ];
                         ]
                       [ txt "Hello, my name is" ];
                     h1
                       ~a:
                         [
                           a_class
                             [
                               "text-7xl";
                               "font-bold";
                               "mb-5";
                               "fade-in-from-left";
                               anim_delay_class 1;
                             ];
                         ]
                       [ txt "Anthony Ceponis" ];
                     p
                       ~a:
                         [ a_class [ "fade-in-from-left"; anim_delay_class 2 ] ]
                       [ txt "and I write code." ];
                   ];
               ];
             (* About section *)
             div
               ~a:
                 [
                   a_class
                     [
                       "flex";
                       "flex-col";
                       "lg:flex-row";
                       "w-full";
                       "justify-around";
                       "items-center";
                       "gap-5";
                     ];
                 ]
               [
                 div
                   [
                     img ~src:"/static/profile.jpg" ~alt:"Example Image"
                       ~a:
                         [
                           a_class [ "fade-in-from-above"; "mx-auto" ];
                           a_width 400;
                         ]
                       ();
                   ];
                 div
                   ~a:
                     [
                       a_class
                         [
                           "max-w-xl";
                           "flex";
                           "flex-col";
                           "justify-center";
                           "gap-5";
                         ];
                     ]
                   [
                     h2
                       ~a:
                         [
                           a_class
                             [
                               "text-4xl"; "font-semibold"; "fade-in-from-above";
                             ];
                         ]
                       [ txt "About me" ];
                     p
                       ~a:
                         [
                           a_class [ "fade-in-from-above"; anim_delay_class 1 ];
                         ]
                       [
                         txt
                           "I am a computer science student at Queens' College \
                            in the University of Cambridge.";
                       ];
                     p
                       ~a:
                         [
                           a_class [ "fade-in-from-above"; anim_delay_class 3 ];
                         ]
                       [
                         txt
                           "More recently, I have taken a strong interest in \
                            applying AI to the domain of sports, a concept I \
                            find particularly exciting.";
                       ];
                     p
                       ~a:
                         [
                           a_class [ "fade-in-from-above"; anim_delay_class 2 ];
                         ]
                       [
                         txt
                           "My development style is driven by the belief that \
                            less is more. I also enjoy taking a mathematical \
                            approach to problems, working my way up from \
                            fundamental and basic ideas.";
                       ];
                     p
                       ~a:
                         [
                           a_class [ "fade-in-from-above"; anim_delay_class 4 ];
                         ]
                       [
                         txt
                           "Outside of my academic work, I represent the \
                            Queens' College football team, am part of the \
                            Cambridge University kickboxing society and like \
                            going on runs. I also love visiting new places, \
                            having been to over 40 countries.";
                       ];
                   ];
               ];
             render_projects projects;
           ];
       ])

let render_home _req =
  Dream.html (Format.asprintf "%a" (Tyxml.Html.pp ()) (page_content ()))

let () =
  Dream.run ~interface:"0.0.0.0" ~port:8080
  @@ Dream.logger
  @@ Dream.router
       [
         Dream.get "/" render_home;
         Dream.get "/static/**" (Dream.static "./public");
       ]
