function overlayBox(e){$(".overlay").fadeIn(),$("#"+e).append('<div class="closeBtn">X</div>');var t=$(window).width(),n=$(".overlay").height(),i=$("#"+e).outerHeight(),r=$("#"+e).outerWidth(),o=(n-i)/2,a=(t-r)/2;0>o?($("#"+e).css("top","30px"),$("#"+e).css("left",+a),$("#"+e).fadeIn()):($("#"+e).css("top",+o),$("#"+e).css("left",+a),$("#"+e).fadeIn())}function showtab(e,t){$(".section").hide(),$("."+e).show(),$(".tabheading li").removeClass("active"),$(".tabheading li").eq(t).addClass("active")}$(function(){$("iframe").each(function(){var e=$(this).attr("src"),t=e.search(/youtube/i);-1!=t&&(t=e.indexOf("?"),-1!=t?$(this).attr("src",e+"&wmode=transparent"):$(this).attr("src",e+"?wmode=transparent"))}),$(".mobiletab").click(function(){$(".mobiletab").removeClass("active"),$(".section").slideUp();var e=$(this).next(".section").css("display");"none"==e?($(this).next(".section").slideDown(),$(this).addClass("active")):($(this).next(".section").slideUp(),$(this).removeClass("active"))})}),$(document).on("click",".closeBtn",function(){$(".overlay,.overlayBox").fadeOut(),$(".closeBtn").remove(),$(".overlayImg ul li").each(function(){$(this).remove()})});