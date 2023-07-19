$(function () {
    $('#RoleId').on('change', function () {
        GetRoleMenu($(this).val());
    });
});

function GetRoleMenu(roleId) {

    alert(roleId);

    var myArray = new Array();
    var myObject = { RoleId: roleId };
    var jqxhr = $.getJSON(GetSysUrl('User/GetRoleMenu'), myObject, function (data) {
        myArray = data;
    });
    jqxhr.complete(function () {
        selectMenu(myArray);

    });

}




function selectMenu(itemList) {

    //$("#divRight input[name=rights]:not([type=checkbox][readonly=readonly])").each(function () {
    //    $(this).prop('checked', false);
    //});

    /*    $('input:checkbox').removeAttr('checked');*/

    $(itemList).each(function (index, item) {
        var chkId = "chk-Menu-" + item.MenuId;
        $(chkId).prop('checked', true);
    });


}
