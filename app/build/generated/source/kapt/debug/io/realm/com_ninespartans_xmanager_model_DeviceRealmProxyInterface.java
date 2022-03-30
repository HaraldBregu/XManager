package io.realm;


public interface com_ninespartans_xmanager_model_DeviceRealmProxyInterface {
    public org.bson.types.ObjectId realmGet$_id();
    public void realmSet$_id(org.bson.types.ObjectId value);
    public String realmGet$name();
    public void realmSet$name(String value);
    public String realmGet$version();
    public void realmSet$version(String value);
    public String realmGet$type();
    public void realmSet$type(String value);
    public boolean realmGet$active();
    public void realmSet$active(boolean value);
    public String realmGet$mac();
    public void realmSet$mac(String value);
    public String realmGet$ble_mac();
    public void realmSet$ble_mac(String value);
    public com.ninespartans.xmanager.model.DeviceProgram realmGet$program();
    public void realmSet$program(com.ninespartans.xmanager.model.DeviceProgram value);
    public com.ninespartans.xmanager.model.User realmGet$user();
    public void realmSet$user(com.ninespartans.xmanager.model.User value);
    public java.util.Date realmGet$createdAt();
    public void realmSet$createdAt(java.util.Date value);
    public java.util.Date realmGet$updatedAt();
    public void realmSet$updatedAt(java.util.Date value);
}
