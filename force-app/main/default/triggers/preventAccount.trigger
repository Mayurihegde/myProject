trigger preventAccount on Account (before insert) {
    if(trigger.isBefore && trigger.isinsert){
        preventDuplicateAccount.beforeInsert(trigger.new);
    }
}