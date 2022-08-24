global class scheduleoppcldnotify implements Schedulable {
    global void execute(SchedulableContext ocdn){
        oppcldnotify ocldnt = new oppcldnotify();
        Database.executeBatch(ocldnt);
    }

}