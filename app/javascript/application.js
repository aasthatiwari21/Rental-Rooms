// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"

var reg = document.getElementById('signup');
    var log = document.getElementById('login');

    var regLink = document.getElementById('signup-link');
    var logLink = document.getElementById('login-link');


    regLink.addEventListener('click', function () {
      log.style.display = 'none';
      reg.style.display = 'block';
    })
    logLink.addEventListener('click', function () {
      log.style.display = 'block';
      reg.style.display = 'none';
 })

  document.addEventListener("DOMContentLoaded", function() {
    const showReviewFormButton = document.getElementById("show-review-form");
    const reviewForm = document.getElementById("review-form");

    showReviewFormButton.addEventListener("click", function() {
      if (reviewForm.style.display === "none" || reviewForm.style.display === "") {
        reviewForm.style.display = "block";
      } else {
        reviewForm.style.display = "none";
      }
    });
  });



