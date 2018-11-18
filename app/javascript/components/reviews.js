//Arrow color to green when clicked
  const arrow = (document.getElementsByClassName('review-arrow'))[0];
  // console.log(arrow);

    // 2. Function to increment the number of likes and change de color of the arrow
    const pinkB = (e) => {

      e.currentTarget.classList.add('vote-on');
      e.currentTarget.upvote.children[0]
    };
    // 1. Function to vote : EventListener
  arrow.addEventListener("click", pinkB);



// Increment the rating
  // 1. Catch the element in the DOM
  const upvote = (document.getElementsByClassName('review-upvote'))[0];


  //2. initialize a counter to add to the existing number of likes
  let n = 0;

  //3. increment the vote at each click
  const increment = (e) => {
    console.log(e);
    e.currentTarget.children[1].innerHTML = ((n*1) + 1);
    n += 1;
    };

  upvote.addEventListener("click", increment);

  //4. Refresh the page to update the vote number at each click.
  document.addEventListener("DOMContentLoaded", increment);

export { reviews };

//TODO: how to make the likes persist after reloading the page ?
