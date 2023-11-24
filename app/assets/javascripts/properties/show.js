document.getElementById("abc").addEventListener("click",function(){
    alert('are you sure you want to contact owner')
  })
   function clickevent() {
     var x = document.getElementById("review");
     if (x.style.display === "none") {
       x.style.display = "block";
     } 
     else {
       x.style.display = "none";
     }
   }
  
    //   $("img").hover(function(){
    //     $(this).hide();
    // },
    //   function(){
    //     $(this).show();
    //   });
 //   $(document).ready(function(){
   $("#contact_o").on({
    click: function(){
      $(this).css("background-color","red");
    },
    mouseenter: function(){
      $(this).css("background-color","blue");
    }, 
    mouseleave: function(){
      $(this).css("background-color","black");
    }

   });

   // $("#see1").click(function(){
   //      $("#imggg").fadeToggle(500);
   //  });
   $("#see2").click(function(){
        $("#imggg").fadeIn(500);
    });

    //  $("#see1").click(function(){
    //     $("#imggg").slideUp(1000);
    // });
      $("#see1").click(function(){
        $("#imggg").slideToggle(1000 , function(){
          alert('image is now hidden');
        });
    });
   // $("#see2").click(function(){
   //      $("#imggg").slideDown(1000);
   //  });

    $("#see3").click(function(){
        $("#imggg").animate({
          height: "350px",
          width: "350px"
        });
    });
    $("#see4").click(function(){
        $("#imggg").animate({
          height: "200px",
          width: "300px"
        });
    });



    