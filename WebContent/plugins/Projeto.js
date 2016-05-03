$(document).ready(function(){
            $(".cont_tab").hide();
            $("ul.tabs li:first").addClass("active").show();
            $(".cont_tab:first").show();
            $("ul.tabs li").click(function () {
                $("ul.tabs li").removeClass("active")
                $(this).addClass("active")
                $(".cont_tab").hide();
                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn("slow");
                return false;
             });
});

$("div#tabela").scroll(function () {
      $('div#tabela #cabecalhoHorizontal, #versus').css('top', $(this).scrollTop());
      $('div#tabela #cabecalhoVertical, #versus').css('left', $(this).scrollLeft());
});