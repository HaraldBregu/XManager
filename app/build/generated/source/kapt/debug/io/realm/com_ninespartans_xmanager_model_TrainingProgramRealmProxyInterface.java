package io.realm;


public interface com_ninespartans_xmanager_model_TrainingProgramRealmProxyInterface {
    public org.bson.types.ObjectId realmGet$_id();
    public void realmSet$_id(org.bson.types.ObjectId value);
    public String realmGet$title();
    public void realmSet$title(String value);
    public String realmGet$description();
    public void realmSet$description(String value);
    public RealmList<com.ninespartans.xmanager.model.Program> realmGet$programs();
    public void realmSet$programs(RealmList<com.ninespartans.xmanager.model.Program> value);
    public java.util.Date realmGet$createdAt();
    public void realmSet$createdAt(java.util.Date value);
    public java.util.Date realmGet$updatedAt();
    public void realmSet$updatedAt(java.util.Date value);
    public java.util.Date realmGet$startDate();
    public void realmSet$startDate(java.util.Date value);
    public boolean realmGet$active();
    public void realmSet$active(boolean value);
}
