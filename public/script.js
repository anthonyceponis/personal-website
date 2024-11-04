document.addEventListener("DOMContentLoaded", function () {
  const fadeIns = document.querySelectorAll(".fade-in-from-above");

  // Set up the observer
  const observer = new IntersectionObserver(
    (entries, observer) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("visible"); // Add class when element is in view
          observer.unobserve(entry.target); // Stop observing once the animation is triggered
        }
      });
    },
    { threshold: 0.25 },
  ); // Trigger when 10% of the element is visible

  // Observe each element with the fade-in class
  fadeIns.forEach((fadeIn) => observer.observe(fadeIn));
});
