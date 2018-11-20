//Arrow color to green when clicked
const arrow = (document.getElementsByClassName('upvotes-arrow'))[0];
// console.log(arrow);

  // 2. Function to increment the number of likes and change de color of the arrow
  const pinkB = (e) => {
    e.currentTarget.classList.add('vote-on');
    e.currentTarget.upvote.children[0]
  };

// 1. Function to vote : EventListener
arrow.addEventListener("click", pinkB);

export { reviews };
