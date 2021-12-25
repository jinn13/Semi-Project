$(document).ready(function() {
    $(".checked_delete_title #chk_all").click(function() {
        if($(".checked_delete_title #chk_all").is(":checked")) $("input[name=chk]").prop("checked", true);
        else $("input[name=chk]").prop("checked", false);
    });
    
    $("input[name=chk]").click(function() {
        var total = $("input[name=chk]").length;
        var checked = $("input[name=chk]:checked").length;
        
        if(total != checked) $(".checked_delete_title #chk_all").prop("checked", false);
        else $(".checked_delete_title #chk_all").prop("checked", true); 
    });

        var selection = document.getElementById("categories_option_box");
    function select() {
    alert(selection.options[selection.selectedIndex].value);
    };
});