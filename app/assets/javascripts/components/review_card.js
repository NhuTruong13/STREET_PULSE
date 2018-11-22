function reviewCard () { $(function(){
    $('.card-head > span').click(function(){
        console.log("siema!");

        $(this).parent().parent().toggleClass('collapsed');
        $(this).parent().parent().find('.card-body').slideToggle();
    });
});
}

// export { reviewCard }
