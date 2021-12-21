    $(document).ready(function(){
      $('.main-slide>.slick').slick({
        arrows: false,
        dots: true,
        autoplay: true,
        autoplaySpeed: 10500,
        // infinite: false
      });

      $('.img-slide').slick({
        slidesToShow: 4, 
        slidesToScroll: 1,
        prevArrow : $(".sml-left"),
        nextArrow : $(".sml-right"),
        autoplay: true,
        autoplaySpeed: 5000,
        // arrows: false,
        // prevArrow : "<button type='button' class='slick-prev'></button>",
        // nextArrow : "<button type='button' class='slick-next'></button>",
      });

      $('.img-slide2').slick({
        slidesToShow: 4, 
        slidesToScroll: 1,
        prevArrow : $(".sml-left2"),
        nextArrow : $(".sml-right2"),
        autoplay: true,
        autoplaySpeed: 5000,
      });

      $('.item-img').hover(
          (event)=>{
              if(event.type === 'mouseenter'){
                  $(event.target).fadeTo(100, 0.5);
              }else if(event.type === 'mouseleave'){
                  $(event.target).fadeTo(100, 1);
              }
          }
        );

        $('.main-slide2>.slick').slick({
        // arrows: false,
        // dots: false,
        slidesToShow: 1,
        pauseOnHover:false,
        autoplay: true,
        autoplaySpeed: 10000,
        prevArrow : $(".main-left2"),
        nextArrow : $(".main-right2"),
      });

      $('.img-slide3').slick({
        slidesToShow: 4, 
        slidesToScroll: 1,
        prevArrow : $(".sml-left3"),
        nextArrow : $(".sml-right3"),
        autoplay: true,
        autoplaySpeed: 5000,
      });

      $('.img-slide4').slick({
        slidesToShow: 4, 
        slidesToScroll: 1,
        prevArrow : $(".sml-left4"),
        nextArrow : $(".sml-right4"),
        autoplay: true,
        autoplaySpeed: 5000,
      });


    });
