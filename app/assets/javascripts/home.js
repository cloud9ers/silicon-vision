// $(document).ready(function(){
//    var imgArr = new Array( // relative paths of images
//      'assets/sub-head-bg2.png',
//      'assets/sub-head-bg.png'
//      );
     
//     var preloadArr = new Array();
//     var i;
     
//     /* preload images */
//     for(i=0; i < imgArr.length; i++){
//      preloadArr[i] = new Image();
//      preloadArr[i].src = imgArr[i];
//     }
//     var currImg = 1;
//     var intID = setInterval(changeImg, 6000);
     
//     $(".slider-next").on("click", function(){ 
//         if (currImg > preloadArr.length ){
//         	currImg = 1
//         }      
//         clearTimeout(intID)
//         changeImg();
//     });
//     $(".slider-prev").on("click", function(){      
//         currImg = currImg - 2
//         if (currImg <= 1 ){
//         	currImg = preloadArr.length
//         }     
//         clearTimeout(intID)
//         changeImg();
//     });

//     /* image rotator */
//     function changeImg(){
//      $('#slider-header').animate({opacity: 0}, 5000, function(){
//      $(this).css('background','url(' + preloadArr[currImg++%preloadArr.length].src +') top center no-repeat fixed');
//      $(this).css({
//         width: "100%",
//         -webkit-background-size: "cover",
//         -moz-background-size: "cover",
//         -o-background-size: "cover",
//         background-size: "cover"
//      });

//      }).animate({opacity: 1}, 5000);
//      intID = setInterval(changeImg, 6000);
//     }
//   });