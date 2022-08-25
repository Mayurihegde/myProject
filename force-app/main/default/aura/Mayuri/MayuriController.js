({
    handleClick : function (cmp, event, helper) {
        var StrName='';
        StrName += event.getSource().get("v.label");
        helper.helperMethod(StrName);
    }
});