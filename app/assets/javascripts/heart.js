const heart = document.getElementsByClassName('heart')[0];

const animate = (e) => {
  console.log(e);
  e.currentTarget.classList.toggle("is-active");
}

heart.addEventListener("click", animate);
