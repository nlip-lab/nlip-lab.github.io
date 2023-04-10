---
title: Gallery
permalink: /gallery/
---

<html lang="en">
<head>
<style>
* {
box-sizing: border-box;
    }
.wrapper {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 10px;
    }
.gallery {
  width: 800px;
  margin: auto;
  border-radius: 3px;
  overflow: hidden;
}
.img-c {
  width: 200px;
  height: 200px;
  float: left;
  position: relative;
  overflow: hidden;
}
.img-w {
  position: absolute;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  cursor: pointer;
}
.img-w img {
  display: none;
}
.img-c {
    transition: None
}
.img-c:hover .img-w {
  transform: scale(1.08);
}
.img-c.active {
  width: 100% !important;
  height: 100% !important;
  position: absolute;
  z-index: 2;
}
.img-c.postactive {
  position: absolute;
  z-index: 2;
  pointer-events: none;
}
.img-c.active.positioned {
  left: 0 !important;
  top: 0 !important;
}
</style>
</head>

<body>

<h3> {{site.name}} Gallery </h3>

<div class="gallery">
  {%for img in site.data.gallery%}
  <div class="img-w">
    <img src="/images/gallery/{{img.img}}" alt="">
  </div>
  {%endfor%}
</div>


<hr>

<h3 id="#contact"> Contact Us </h3>
<span style="display: block; margin-bottom: 3em"></span>

<!-- CONTACT -->
<div class="row" style="margin-top:50px">
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Address</h4>
        <p>{{site.address}}</p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Phone</h4>
        <p>{{site.phone}}</p>
    </div>
    <div class="column" style="float:left; width:250px; text-align:center; padding-right:10px">
        <h4>Office Hours:</h4>
        <p>{{site.office_hours}}</p>
    </div>
</div>

<!-- LAB LOCATION -->
<div style="position:relative; width:100%; height:500px">
  <iframe 
    src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1866.6682220334442!2d78.12359467897458!3d17.595584129661564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1680867993295!5m2!1sen!2sin" 
    style="width:100%; height:100%"
    title="Google Maps Location of {{site.name}}" 
    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen>
    </iframe>
</div>

<span style="display: block; margin-bottom: 3em"></span>


<script>
$(function() {
  $(".img-w").each(function() {
    $(this).wrap("<div class='img-c'></div>")
    let imgSrc = $(this).find("img").attr("src");
     $(this).css('background-image', 'url(' + imgSrc + ')');
  })
            
  $(".img-c").click(function() {
    let w = $(this).outerWidth()
    let h = $(this).outerHeight()
    let x = $(this).offset().left
    let y = $(this).offset().top
    
    $(".active").not($(this)).remove()
    let copy = $(this).clone();
    copy.insertAfter($(this)).height(h).width(w).addClass("active")
    $(".active").css('top', y - 8);
    $(".active").css('left', x - 8);
    
      setTimeout(function() {
    copy.addClass("positioned")
  }, 0)
    
  }) 

})
$(document).on("click", ".img-c.active", function() {
  let copy = $(this)
  copy.removeClass("positioned active").addClass("postactive")
  setTimeout(function() {
    copy.remove();
  }, 500)
})
</script>


</body>
</html>