let render _request = 
  Dream.html
    {|
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>OCaml with Tailwind CSS</title>
      <link href="/static/tailwind.css" rel="stylesheet">
    </head>
    <body class="font-sans">
      <div class="max-w-7xl mx-auto">
        <div class="flex h-screen items-center justify-center">
          <div class="text-center">
            <h3 class="text-2xl font-semi-bold fade-in-from-left">Hello, my name is</h3>
            <h1 class="text-7xl font-bold mb-5 fade-in-from-left anim-delay-1">Anthony Ceponis</h1>
            <p class="fade-in-from-left anim-delay-2">and I write code.</p>
          </div>
        </div>
        <div class="flex flex-col items-center gap-2 mb-10">
          <div class="flex w-full justify-around gap-3">
            <div>
              <img src="/static/profile.jpg" alt="Example Image" width="400" class="fade-in-from-above">  
            </div>
            <div class="max-w-xl flex flex-col justify-center gap-5">
              <p class="fade-in-from-above"> I am a computer science student at Queens' College in the University of Cambridge.</p> 
              <p class="fade-in-from-above anim-delay-1">Unlike most , I do not advertise myself as an expert in one field but instead consider myself a jack of all trades, diving into everything and anything I find even remotely interesting!</p>
              <p class="fade-in-from-above anim-delay-2">I enjoy taking a mathematical approach to learning, starting from basic fundamentals and slowly working my way up. Consequently, I take a minimal approach to writing software and try to avoid using bloated frameworks when possible.</p>
              <p class="fade-in-from-above anim-delay-3">Outside of my academic work, I represent the Queens' College football team, am part of the Cambridge University kickboxing society and like going on runs. I also love visiting new places, having been to over 40 countries.</p>
            </div>  
          </div
        </div> 
      </div>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        const fadeIns = document.querySelectorAll(".fade-in-from-above");

        // Set up the observer
        const observer = new IntersectionObserver((entries, observer) => {
          entries.forEach(entry => {
              if (entry.isIntersecting) {
                  entry.target.classList.add("visible"); // Add class when element is in view
                  observer.unobserve(entry.target); // Stop observing once the animation is triggered
              }
            });
        }, { threshold: .25 }); // Trigger when 10% of the element is visible

        // Observe each element with the fade-in class
        fadeIns.forEach(fadeIn => observer.observe(fadeIn));
      });
    </script>
    </body>
    </html>    
  |}

let () = 
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" render;
    Dream.get "/static/**" (Dream.static "./public");
  ]
