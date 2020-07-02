reviewForm = document.getElementById('review-form');

document.querySelector(".review-btn").addEventListener('click', (event) => {
  event.preventDefault();
  reviewForm.classList.toggle("visible");
});

