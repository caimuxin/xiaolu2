
jQuery(function()
{
    $ = jQuery ;
    
    $("#templatemo_banner_slide").attr("style","background:url('static/login/images/logingb.png')");
    
    changebg();
    
});


function changebg(){
    banner_slider_height = $(window).outerHeight()-285;
	
	var bheight = document.documentElement.clientHeight;
	if(bheight == 0){bheight = 1000;}
    banner_slider_height = (banner_slider_height<bheight) ? bheight : banner_slider_height;
    $("#templatemo_banner_slide > div").height(banner_slider_height);
    $("#templatemo_banner_slide").height(banner_slider_height);
    $(window).resize(function(){
        banner_slider_height = $(window).outerHeight()-285;
        banner_slider_height = (banner_slider_height<bheight) ? bheight : banner_slider_height;
        $("#templatemo_banner_slide > div").height(banner_slider_height);
        $("#templatemo_banner_slide").height(banner_slider_height);
    });
	
}


window.onresize=function(){
	changebg();
}