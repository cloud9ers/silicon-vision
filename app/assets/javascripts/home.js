$(document).ready(function(){
   var imgArr = new Array( // relative paths of images
     'assets/1.png',
     'assets/2.png',
     'assets/3.png',
     'assets/4.png',
     'assets/sub-head-bg.png'
     );
     
    var preloadArr = new Array();
    var i;
     
    /* preload images */
    for(i=0; i < imgArr.length; i++){
     preloadArr[i] = new Image();
     preloadArr[i].src = imgArr[i];
    }
    var currImg = 1;
    var intID = setInterval(changeImg, 6000);
     
    $(".slider-next").on("click", function(){ 
        if (currImg > preloadArr.length ){
        	currImg = 1
        }      
        clearTimeout(intID)
        changeImg();
    });
    $(".slider-prev").on("click", function(){      
        currImg = currImg - 2
        if (currImg <= 1 ){
        	currImg = preloadArr.length
        }     
        clearTimeout(intID)
        changeImg();
    });

    /* image rotator */
    function changeImg(){
     $('#slider-header').animate({opacity: 0}, 1000, function(){
     $(this).css('background','url(' + preloadArr[currImg++%preloadArr.length].src +') top center no-repeat');
     }).animate({opacity: 1}, 1000);
     intID = setInterval(changeImg, 6000);
    }
  });