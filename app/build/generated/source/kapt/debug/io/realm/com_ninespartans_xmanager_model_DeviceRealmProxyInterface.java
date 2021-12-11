package io.realm;


public interface com_ninespartans_xmanager_model_DeviceRealmProxyInterface {
    public org.bson.types.ObjectId realmGet$_id();
    public void realmSet$_id(org.bson.types.ObjectId value);
    public com.ninespartans.xmanager.model.User realmGet$user();
    public void realmSet$user(com.ninespartans.xmanager.model.User value);
    public String realmGet$name();
    public void realmSet$name(String value);
    public String realmGet$firmwareVersion();
    public void realmSet$firmwareVersion(String value);
    public String realmGet$mac();
    public void realmSet$mac(String value);
    public String realmGet$ble_mac();
    public void realmSet$ble_mac(String value);
    public String realmGet$wifi_mac();
    public void realmSet$wifi_mac(String value);
    public RealmList<com.ninespartans.xmanager.model.Program> realmGet$programs();
    public void realmSet$programs(RealmList<com.ninespartans.xmanager.model.Program> value);
    public java.util.Date realmGet$createdAt();
    public void realmSet$createdAt(java.util.Date value);
    public java.util.Date realmGet$updatedAt();
    public void realmSet$updatedAt(java.util.Date value);
}
